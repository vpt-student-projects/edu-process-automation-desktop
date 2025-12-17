using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using volpt.Core;
using volpt.MVVM.Model;

namespace volpt.MVVM.ViewModel
{
    public class ScheduleViewModel : INotifyPropertyChanged
    {
        private DateTime _currentWeekStart;
        private readonly int _userId;

        public ScheduleViewModel(int userId)
        {
            _userId = userId;

            PreviousWeekCommand = new RelayCommand(PreviousWeek);
            NextWeekCommand = new RelayCommand(NextWeek);
            CurrentWeekCommand = new RelayCommand(GoToCurrentWeek);

            // Загружаем актуальную неделю при запуске
            GoToCurrentWeek();
        }

        public ICommand PreviousWeekCommand { get; }
        public ICommand NextWeekCommand { get; }
        public ICommand CurrentWeekCommand { get; }

        private string _weekDisplay;
        public string WeekDisplay
        {
            get => _weekDisplay;
            set
            {
                _weekDisplay = value;
                OnPropertyChanged();
            }
        }

        private bool _isCurrentWeek;
        public bool IsCurrentWeek
        {
            get => _isCurrentWeek;
            set
            {
                _isCurrentWeek = value;
                OnPropertyChanged();
            }
        }

        private List<DaySchedule> _schedule;
        public List<DaySchedule> Schedule
        {
            get => _schedule;
            set
            {
                _schedule = value;
                OnPropertyChanged();
            }
        }

        private void PreviousWeek()
        {
            try
            {
                _currentWeekStart = _currentWeekStart.AddDays(-7);
                UpdateWeekInfo();
                _ = LoadUserScheduleAsync();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при переходе на предыдущую неделю");
            }
        }

        private void NextWeek()
        {
            try
            {
                _currentWeekStart = _currentWeekStart.AddDays(7);
                UpdateWeekInfo();
                _ = LoadUserScheduleAsync();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при переходе на следующую неделю");
            }
        }

        private void GoToCurrentWeek()
        {
            try
            {
                var today = DateTime.Today;
                _currentWeekStart = today.DayOfWeek == DayOfWeek.Sunday
                    ? GetStartOfWeek(today).AddDays(7)
                    : GetStartOfWeek(today);

                UpdateWeekInfo();
                _ = LoadUserScheduleAsync();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при переходе к текущей неделе");
            }
        }

        private void UpdateWeekInfo()
        {
            try
            {
                var weekEnd = _currentWeekStart.AddDays(6);
                WeekDisplay = $"{_currentWeekStart:dd.MM}–{weekEnd:dd.MM}";

                // Проверяем, является ли текущая отображаемая неделя актуальной
                var today = DateTime.Today;
                var currentWeekStart = today.DayOfWeek == DayOfWeek.Sunday
                    ? GetStartOfWeek(today).AddDays(7)
                    : GetStartOfWeek(today);

                IsCurrentWeek = _currentWeekStart.Date == currentWeekStart.Date;
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при обновлении информации о неделе");
                WeekDisplay = "Ошибка";
                IsCurrentWeek = false;
            }
        }

        private DateTime GetStartOfWeek(DateTime date)
        {
            try
            {
                int diff = (7 + (date.DayOfWeek - DayOfWeek.Monday)) % 7;
                return date.AddDays(-1 * diff).Date;
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при расчете начала недели");
                return date.Date;
            }
        }

        private async Task LoadUserScheduleAsync()
        {
            try
            {
                // Даты текущей недели
                var weekDates = Enumerable.Range(0, 6)
                    .Select(i => DateOnly.FromDateTime(_currentWeekStart.AddDays(i)))
                    .ToList();

                using var db = new VolpteducationDbContext();

                var lessons = await db.Lessons
                    .Include(l => l.Subject)
                    .Include(l => l.Group)
                    .Include(l => l.User)
                    .Where(l => l.UserId == _userId && weekDates.Contains(l.Date))
                    .OrderBy(l => l.Date)
                    .ThenBy(l => l.Number)
                    .ToListAsync();

                // Создаем расписание на всю неделю
                Schedule = weekDates.Select(date => new DaySchedule
                {
                    DayName = GetDayOfWeekName(date),
                    Date = date.ToString("dd.MM"),
                    Lessons = lessons
                        .Where(l => l.Date == date)
                        .OrderBy(l => l.Number)
                        .Select(l => new LessonItem
                        {
                            Id = l.Id,
                            GroupId = l.GroupId,
                            SubjectId = l.SubjectId,
                            Date = l.Date,
                            Number = l.Number.ToString(),
                            Subject = l.Subject?.Name ?? "Не указано",
                            Time = GetTimeByNumber(l.Number),
                            Group = l.Group?.Name ?? "Не указано",
                            Room = l.Classroom ?? "Не указано"
                        })
                        .ToList()
                }).ToList();
            }
            catch (DbUpdateException dbEx)
            {
                HandleError("Ошибка обновления базы данных при загрузке расписания");
                Schedule = CreateEmptySchedule();
            }
            catch (InvalidOperationException invEx)
            {
                HandleError("Ошибка операции с базой данных при загрузке расписания");
                Schedule = CreateEmptySchedule();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при загрузке расписания");
                Schedule = CreateEmptySchedule();
            }
        }

        private List<DaySchedule> CreateEmptySchedule()
        {
            try
            {
                var weekDates = Enumerable.Range(0, 6)
                    .Select(i => DateOnly.FromDateTime(_currentWeekStart.AddDays(i)))
                    .ToList();

                return weekDates.Select(date => new DaySchedule
                {
                    DayName = GetDayOfWeekName(date),
                    Date = date.ToString("dd.MM"),
                    Lessons = new List<LessonItem>()
                }).ToList();
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при создании пустого расписания");
                return new List<DaySchedule>();
            }
        }

        private string GetTimeByNumber(int number)
        {
            try
            {
                return number switch
                {
                    1 => "08:30–10:00",
                    2 => "10:10–11:40",
                    3 => "12:10–13:40",
                    4 => "13:50–15:20",
                    5 => "15:30–17:00",
                    6 => "17:10–18:40",
                    _ => ""
                };
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при определении времени занятия");
                return "Ошибка";
            }
        }

        private string GetDayOfWeekName(DateOnly date)
        {
            try
            {
                return date.DayOfWeek switch
                {
                    DayOfWeek.Monday => "Понедельник",
                    DayOfWeek.Tuesday => "Вторник",
                    DayOfWeek.Wednesday => "Среда",
                    DayOfWeek.Thursday => "Четверг",
                    DayOfWeek.Friday => "Пятница",
                    DayOfWeek.Saturday => "Суббота",
                    _ => "Воскресенье"
                };
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при определении дня недели");
                return "Ошибка";
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

       

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName = null)
        {
            try
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при обновлении свойства");
            }
        }
    }
}