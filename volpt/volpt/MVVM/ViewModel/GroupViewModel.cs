using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.PlatformUI;
using volpt.MVVM.Model;

namespace volpt.MVVM.ViewModel
{
    public class GroupViewModel : ObservableObject
    {
        private ObservableCollection<GroupModel> _groups;
        public ObservableCollection<GroupModel> Groups
        {
            get => _groups;
            set => SetProperty(ref _groups, value);
        }

        public GroupViewModel()
        {
            LoadGroups();
        }

        private void LoadGroups()
        {
            Groups = new ObservableCollection<GroupModel>();

            // Здесь вы должны получить данные из базы через EF Core
            LoadGroupsFromDatabase();
        }

        private async void LoadGroupsFromDatabase()
        {
                using var context = new VolpteducationDbContext();

                // Загружаем группы со студентами, занятиями и предметами
                var groups = await context.Groups
                    .Include(g => g.Students)
                    .Include(g => g.Lessons)
                        .ThenInclude(l => l.Subject)
                    .ToListAsync();

                foreach (var group in groups)
                {
                    // Создаем модель группы
                    var groupModel = new GroupModel
                    {
                        Id = group.Id,
                        Name = group.Name,
                        StudentCount = group.Students?.Count ?? 0,
                        LessonCount = group.Lessons?.Count ?? 0
                    };

                    // Получаем уникальные предметы из занятий группы
                    if (group.Lessons != null && group.Lessons.Any())
                    {
                        var uniqueSubjects = group.Lessons
                            .Where(l => l.Subject != null)
                            .Select(l => l.Subject)
                            .GroupBy(s => s.Id)
                            .Select(g => g.First())
                            .ToList();

                        foreach (var subject in uniqueSubjects)
                        {
                            groupModel.Subjects.Add(new SubjectModel
                            {
                                Id = subject.Id,
                                Code = GetSubjectCode(subject.Name),
                                Title = subject.Name,
                                TotalHours = subject.TotalHours ?? 0
                            });
                        }
                    }

                    Groups.Add(groupModel);
                }
        }

        private string GetSubjectCode(string subjectName)
        {
            // Логика извлечения кода МДК из названия предмета
            if (subjectName.Contains("МДК"))
            {
                var parts = subjectName.Split(' ');
                if (parts.Length >= 2)
                {
                    return $"{parts[0]} {parts[1]}";
                }
            }
            return string.Empty;
        }
    }
}
