using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using volpt.MVVM.Model;
using System.Collections.Generic;
using System.Linq;

namespace volpt.MVVM.ViewModel
{
	public class MainWindowViewModel
	{
		public List<DaySchedule> Schedule { get; set; }

		public MainWindowViewModel()
		{
			using var db = new VolpteducationDbContext();

			var lessons = db.Lessons
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
						Subject = l.Subject.Name,
						Time = GetTimeByNumber(l.Number),
						Group = l.Group.Name,
						Room = l.Classroom ?? ""
					}).ToList()
				})
				.ToList();
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
