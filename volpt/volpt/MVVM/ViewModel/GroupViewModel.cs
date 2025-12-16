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
            _userId = userId;
            Groups = new ObservableCollection<GroupModel>();

            // Инициализация команд
            ToggleGroupCommand = new RelayCommand<GroupModel>(ToggleGroup);
            ViewScheduleCommand = new RelayCommand<GroupModel>(ViewGroupSchedule);
            ViewStudentsCommand = new RelayCommand<GroupModel>(ViewGroupStudents);
            RefreshCommand = new RelayCommand(LoadGroups);

            // Загружаем группы
            LoadGroups();
        }

        public void LoadGroups()
        {
            // Не блокируем UI‑поток, запускаем асинхронную загрузку
            _ = LoadGroupsAsync();
        }

        private async Task LoadGroupsAsync()
        {
            IsLoading = true;
            Groups.Clear();

            try
            {
                await LoadGroupsFromDatabaseAsync();
            }
            catch (Exception ex)
            {
                // Обработка ошибки в UI потоке
                await Application.Current.Dispatcher.InvokeAsync(() =>
                {
                    MessageBox.Show($"Ошибка загрузки групп: {ex.Message}",
                        "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                });
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
            using var context = new VolpteducationDbContext();

            // Загружаем только те группы, в которых текущий преподаватель ведет предметы
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

            // Обрабатываем в UI потоке
            await Application.Current.Dispatcher.InvokeAsync(() =>
            {
                foreach (var group in groups)
                {
                    // Создаем модель группы
                    var groupModel = new GroupModel
                    {
                        Id = group.Id,
                        Name = group.Name,
                        StudentCount = group.Students?.Count ?? 0,
                        LessonCount = group.Lessons?.Count ?? 0,
                        IsExpanded = false // По умолчанию все группы свернуты
                    };

                    // Получаем уникальные предметы из занятий группы, которые ведет текущий преподаватель
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
                    }

                    Groups.Add(groupModel);
                }
            });
        }

        // Метод для переключения состояния группы
        private void ToggleGroup(GroupModel group)
        {
            if (group != null)
            {
                group.IsExpanded = !group.IsExpanded;
            }
        }

        // Метод для просмотра расписания группы
        private void ViewGroupSchedule(GroupModel group)
        {
            if (group != null)
            {
                MessageBox.Show($"Открыть расписание группы: {group.Name} (ID: {group.Id})",
                    "Расписание", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        // Метод для просмотра студентов группы
        private void ViewGroupStudents(GroupModel group)
        {
            if (group != null)
            {
                MessageBox.Show($"Открыть студентов группы: {group.Name} (ID: {group.Id})",
                    "Студенты", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private string GetSubjectCode(string subjectName)
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

            // Старая логика как запасной вариант
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

        // Метод для очистки названия предмета от кода
        private string CleanSubjectName(string subjectName, string code)
        {
            if (string.IsNullOrEmpty(subjectName))
                return subjectName;

            if (!string.IsNullOrEmpty(code))
            {
                var cleaned = subjectName.Replace(code, "").Trim();
                // Убираем возможные лишние символы в начале
                cleaned = cleaned.TrimStart('.', '-', ' ', '\t');
                return cleaned;
            }

            return subjectName.Trim();
        }
    }
}