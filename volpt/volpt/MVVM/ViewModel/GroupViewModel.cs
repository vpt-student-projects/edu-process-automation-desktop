using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using volpt.Core;
using volpt.MVVM.Model;

namespace volpt.MVVM.ViewModel
{
    public class GroupViewModel : ObservableObject
    {
        private ObservableCollection<GroupModel> _groups;
        private bool _isLoading;
        private readonly int _userId;

        public ObservableCollection<GroupModel> Groups
        {
            get => _groups;
            set => SetProperty(ref _groups, value);
        }

        public bool IsLoading
        {
            get => _isLoading;
            set => SetProperty(ref _isLoading, value);
        }

        // Команды для управления группами
        public ICommand ToggleGroupCommand { get; }
        public ICommand ViewScheduleCommand { get; }
        public ICommand ViewStudentsCommand { get; }
        public ICommand RefreshCommand { get; }

        public GroupViewModel(int userId)
        {
            try
            {
                _userId = userId;
                Groups = new ObservableCollection<GroupModel>();

                // Инициализация команд
                ToggleGroupCommand = new RelayCommand<GroupModel>(ToggleGroup);
                ViewScheduleCommand = new RelayCommand<GroupModel>(ViewGroupSchedule);
                ViewStudentsCommand = new RelayCommand<GroupModel>(ViewGroupStudents);
                RefreshCommand = new RelayCommand(LoadGroups);
                LoadGroups();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при инициализации GroupViewModel");
                Groups = new ObservableCollection<GroupModel>();
            }
        }

        public void LoadGroups()
        {
            try
            {
                _ = LoadGroupsAsync();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при запуске загрузки групп");
            }
        }

        private async Task LoadGroupsAsync()
        {
            try
            {
                await Application.Current.Dispatcher.InvokeAsync(() =>
                {
                    IsLoading = true;
                    Groups.Clear();
                });
            }
           
            catch (Exception ex)
            {
                HandleError("Ошибка при подготовке к загрузке групп");
                return;
            }

            try
            {
                await LoadGroupsFromDatabaseAsync();
            }
            catch (DbUpdateException dbEx)
            {
                HandleError("Ошибка обновления базы данных при загрузке групп");
            }
            catch (InvalidOperationException ioEx)
            {
                HandleError("Ошибка операции с базой данных");
            }
            catch (Exception ex)
            {
                HandleError("Ошибка загрузки групп");
            }
            finally
            {
                await Application.Current.Dispatcher.InvokeAsync(() =>
                {
                    IsLoading = false;
                });
            }
        }

        private async Task LoadGroupsFromDatabaseAsync()
        {
            try
            {
                using var context = new VolpteducationDbContext();
                var groups = await context.UserGroupSubject
                    .Where(ugs => ugs.UserId == _userId)
                    .Select(ugs => ugs.GroupId)
                    .Distinct()
                    .Join(context.Groups
                            .Include(g => g.Students)
                            .Include(g => g.Lessons)
                                .ThenInclude(l => l.Subject),
                          id => id,
                          g => g.Id,
                          (id, g) => g)
                    .ToListAsync();
                await Application.Current.Dispatcher.InvokeAsync(() =>
                {
                    try
                    {
                        foreach (var group in groups)
                        {
                            try
                            {
                                var groupModel = new GroupModel
                                {
                                    Id = group.Id,
                                    Name = group.Name,
                                    StudentCount = group.Students?.Count ?? 0,
                                    LessonCount = group.Lessons?.Count ?? 0,
                                    IsExpanded = false // По умолчанию все группы свернуты
                                };
                                if (group.Lessons != null && group.Lessons.Any())
                                {
                                    var uniqueSubjects = group.Lessons
                                        .Where(l => l.Subject != null && l.UserId == _userId)
                                        .Select(l => l.Subject)
                                        .GroupBy(s => s.Id)
                                        .Select(g => g.First())
                                        .ToList();

                                    foreach (var subject in uniqueSubjects)
                                    {
                                        try
                                        {
                                            var code = GetSubjectCode(subject.Name);
                                            var title = CleanSubjectName(subject.Name, code);

                                            groupModel.Subjects.Add(new SubjectModel
                                            {
                                                Id = subject.Id,
                                                Code = code,
                                                Title = title,
                                                TotalHours = subject.TotalHours ?? 0
                                            });
                                        }
                                        catch (Exception subjectEx)
                                        {
                                            HandleError($"Ошибка при обработке предмета '{subject?.Name}' для группы '{group.Name}'");
                                            groupModel.Subjects.Add(new SubjectModel
                                            {
                                                Id = subject?.Id ?? 0,
                                                Code = "ОШИБКА",
                                                Title = subject?.Name ?? "Неизвестный предмет",
                                                TotalHours = subject?.TotalHours ?? 0
                                            });
                                        }
                                    }
                                }

                                Groups.Add(groupModel);
                            }
                            catch (Exception groupEx)
                            {
                                HandleError($"Ошибка при создании модели для группы '{group?.Name}'");
                                continue;
                            }
                        }
                    }
                    catch (Exception uiEx)
                    {
                        throw new InvalidOperationException("Ошибка при обработке данных в UI потоке");
                    }
                });
            }
            catch (ArgumentNullException anEx)
            {
                throw new InvalidOperationException("Ошибка данных: отсутствуют необходимые данные");
            }
        }
        private void ToggleGroup(GroupModel group)
        {
            try
            {
                if (group != null)
                {
                    group.IsExpanded = !group.IsExpanded;
                }
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при переключении состояния группы");
            }
        }
        private void ViewGroupSchedule(GroupModel group)
        {
            try
            {
                if (group != null)
                {
                    MessageBox.Show($"Открыть расписание группы: {group.Name} (ID: {group.Id})",
                        "Расписание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                HandleError($"Ошибка при открытии расписания группы {group?.Name}");
            }
        }
        private void ViewGroupStudents(GroupModel group)
        {
            try
            {
                if (group != null)
                {
                    MessageBox.Show($"Открыть студентов группы: {group.Name} (ID: {group.Id})",
                        "Студенты", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                HandleError($"Ошибка при открытии списка студентов группы {group?.Name}");
            }
        }

        private string GetSubjectCode(string subjectName)
        {
            try
            {
                if (string.IsNullOrEmpty(subjectName))
                    return string.Empty;

                // Улучшенная логика извлечения кода МДК
                string[] patterns =
                {
                    @"МДК\s+\d{2}\.\d{2}",  // МДК XX.XX
                    @"МДК\s+\d{2}\.\d{3}",  // МДК XX.XXX
                    @"МДК\s+\d{2}\-\d{2}",  // МДК XX-XX
                    @"УП\.\d{2}\.\d{2}"     // УП.XX.XX
                };

                foreach (var pattern in patterns)
                {
                        var match = System.Text.RegularExpressions.Regex.Match(subjectName, pattern);
                        if (match.Success)
                        {
                            return match.Value;
                        }

                }
                if (subjectName.Contains("МДК"))
                {
                    var parts = subjectName.Split(' ', StringSplitOptions.RemoveEmptyEntries);
                    if (parts.Length >= 2)
                    {
                        return $"{parts[0]} {parts[1]}";
                    }
                }

                return string.Empty;
            }
            catch (Exception ex)
            {
                HandleError($"Ошибка при извлечении кода предмета из '{subjectName}'");
                return string.Empty;
            }
        }

        private string CleanSubjectName(string subjectName, string code)
        {
            try
            {
                if (string.IsNullOrEmpty(subjectName))
                    return subjectName;

                if (!string.IsNullOrEmpty(code))
                {
                    var cleaned = subjectName.Replace(code, "").Trim();
                    cleaned = cleaned.TrimStart('.', '-', ' ', '\t');
                    return cleaned;
                }

                return subjectName.Trim();
            }
            catch (Exception ex)
            {
                HandleError($"Ошибка при очистке названия предмета '{subjectName}'");
                return subjectName ?? "Ошибка названия";
            }
        }
        private void HandleError(string message)
        {


            Application.Current?.Dispatcher?.Invoke(() =>
            {

                MessageBox.Show(
                        $"{message}\n",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);

            });

        }

    }
}
