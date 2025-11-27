using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.Generic;
using System.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using volpt.MVVM.Model;

namespace volpt.MVVM.ViewModel
{
	public class MainWindowViewModel
	{
		public List<DaySchedule> Schedule { get; set; }
		public User CurrentUser { get; set; }

		public MainWindowViewModel()
		{ 

            // Для реальных данных - раскомментируйте позже
            LoadUserSchedule(2); // 1 - ID пользователя-преподавателя
            
		}
		public void LoadUserSchedule(int userId)
		{
			using var db = new VolpteducationDbContext();

			// Находим пользователя
			CurrentUser = db.Users
				.Include(u => u.Role)
				.FirstOrDefault(u => u.Id == userId);

            // Загружаем расписание преподавателя
            var startOfWeek = GetStartOfWeek(DateTime.Today);

            // Загружаем расписание преподавателя на текущую неделю
            var weekDates = Enumerable.Range(0, 6)
                .Select(i => DateOnly.FromDateTime(startOfWeek.AddDays(i)))
                .ToList();

            var lessons = db.Lessons
                .Include(l => l.Subject)
                .Include(l => l.Group)
                .Include(l => l.User)
                .Where(l => l.UserId == userId &&
                           weekDates.Contains(l.Date))
                .OrderBy(l => l.Date)
                .ThenBy(l => l.Number)
                .ToList();

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
                        Number = l.Number.ToString(),
                        Subject = l.Subject?.Name ?? "Не указано",
                        Time = GetTimeByNumber(l.Number),
                        Group = l.Group?.Name ?? "Не указано",
                        Room = l.Classroom ?? "Не указано"
                    })
                    .ToList()
            }).ToList();
        }
        private DateTime GetStartOfWeek(DateTime date)
        {
            // Находим понедельник текущей недели
            int diff = (7 + (date.DayOfWeek - DayOfWeek.Monday)) % 7;
            return date.AddDays(-1 * diff).Date;
        }


        private string GetTimeByNumber(int number)
		{
			// пример, подставь своё
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

		private string GetDayOfWeekName(DateOnly date)
		{
			return date.DayOfWeek switch
			{
				DayOfWeek.Monday => "Понедельник",
				DayOfWeek.Tuesday => "Вторник",
				DayOfWeek.Wednesday => "Среда",
				DayOfWeek.Thursday => "Четверг",
				DayOfWeek.Friday => "Пятница",
				DayOfWeek.Saturday => "Суббота",
				_ => "День"
			};
		}
	}
}
