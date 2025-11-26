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
			LoadTestDataForUser();

			
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
			var lessons = db.Lessons
				.Include(l => l.Subject)
				.Include(l => l.Group)
				.Include(l => l.User)  // Связь с пользователем
				.Where(l => l.UserId == userId)  // Фильтруем по пользователю-преподавателю
				.OrderBy(l => l.Date)
				.ThenBy(l => l.Number)
				.ToList();

			Schedule = lessons
				.GroupBy(l => l.Date)
				.Select(g => new DaySchedule
				{
					DayName = GetDayOfWeekName(g.Key),
					Date = g.Key.ToString("dd.MM"),
					Lessons = g.Select(l => new LessonItem
					{
						Number = l.Number.ToString(),
						Subject = l.Subject?.Name ?? "Не указано",
						Time = GetTimeByNumber(l.Number),
						Group = l.Group?.Name ?? "Не указано",
						Room = l.Classroom ?? "Не указано"
					}).ToList()
				})
				.ToList();
		}

		private void LoadTestDataForUser()
		{
			CurrentUser = new User
			{
				Id = 1,
				Login = "i.ivanov",
				FullName = "Иванов Иван Иванович",
				RoleId = 2 // ID роли преподавателя
			};

			Schedule = new List<DaySchedule>
			{
				new DaySchedule
				{
					DayName = "Понедельник",
					Date = "02.12",
					Lessons = new List<LessonItem>
					{
						new LessonItem
						{
							Number = "1",
							Subject = "МДК 02.02",
							Time = GetTimeByNumber(1),
							Group = "ИСП-8",
							Room = "105 ауд."
						},
						new LessonItem
						{
							Number = "2",
							Subject = "МДК 02.02",
							Time = GetTimeByNumber(2),
							Group = "ИСП-9",
							Room = "203 ауд."
						},
						new LessonItem
						{
							Number = "3",
							Subject = "Программирование",
							Time = GetTimeByNumber(3),
							Group = "ИСП-8",
							Room = "301 ауд."
						}
					}
				},
				new DaySchedule
				{
					DayName = "Вторник",
					Date = "03.12",
					Lessons = new List<LessonItem>
					{
						new LessonItem
						{
							Number = "1",
							Subject = "Базы данных",
							Time = GetTimeByNumber(1),
							Group = "ИСП-9",
							Room = "401 ауд."
						},
						new LessonItem
						{
							Number = "4",
							Subject = "МДК 02.02",
							Time = GetTimeByNumber(4),
							Group = "ИСП-8",
							Room = "105 ауд."
						}
					}
				},
				new DaySchedule
				{
					DayName = "Среда",
					Date = "04.12",
					Lessons = new List<LessonItem>
					{
						new LessonItem
						{
							Number = "2",
							Subject = "Программирование",
							Time = GetTimeByNumber(2),
							Group = "ИСП-9",
							Room = "301 ауд."
						}
					}
				}
			};
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
