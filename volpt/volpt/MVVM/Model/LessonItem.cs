using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
	public class LessonItem
	{
		public int Id { get; set; }
		public int SubjectId { get; set; }
		public int GroupId { get; set; }
		public DateOnly Date { get; set; }

		public string Number { get; set; }
		public string Subject { get; set; }
		public string Time { get; set; }
		public string Group { get; set; }
		public string Room { get; set; }
	}
}
