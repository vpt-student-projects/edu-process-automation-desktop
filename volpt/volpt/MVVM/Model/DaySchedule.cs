using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
	public class DaySchedule
	{
		public string DayName { get; set; }
		public string Date { get; set; }
		public List<LessonItem> Lessons { get; set; } = new();
	}
}
