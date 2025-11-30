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
		public ScheduleViewModel ScheduleVM { get; set; }
		public User CurrentUser { get; set; }

		public MainWindowViewModel()
		{
			// Создаем ViewModel для расписания
			ScheduleVM = new ScheduleViewModel(2); // 2 - ID пользователя-преподавателя

			// Загружаем данные пользователя
			LoadCurrentUser(2);
		}

		public void LoadCurrentUser(int userId)
		{
			using var db = new VolpteducationDbContext();
			CurrentUser = db.Users
				.Include(u => u.Role)
				.FirstOrDefault(u => u.Id == userId);
		}
	}
}
