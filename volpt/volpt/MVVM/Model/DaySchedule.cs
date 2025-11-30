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
		public List<LessonSlot> LessonSlots { get; set; } = new();
	}
	public class LessonSlot
	{
		public int Number { get; set; } // 1-6
		public string Time { get; set; }
		public LessonItem Lesson { get; set; } // null если пары нет
		public bool HasLesson => Lesson != null;
	}
}
