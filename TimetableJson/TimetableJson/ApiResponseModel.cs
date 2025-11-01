using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace TimetableJson
{
    public class TeacherSchedule
    {
        public DateTime Date { get; set; }
        public int LessonNumber { get; set; }
        public string Subject { get; set; }
        public string Group { get; set; }
        public string Classroom { get; set; }
    }

    public class ApiLesson
    {
        public string Number { get; set; }
        public string Title { get; set; }
        public string Teacher { get; set; }
        public string Aud { get; set; }
        public bool Remote { get; set; }
    }

    public class ApiGroupSchedule
    {
        public string Name { get; set; }
        public int Corpus { get; set; }
        public List<ApiLesson> Lessons { get; set; }
    }

    public class ApiTimetableResponse
    {
        public long Time { get; set; }
        public Dictionary<string, Dictionary<string, Dictionary<string, ApiGroupSchedule>>> Timetable { get; set; }
        public List<object> Orders { get; set; } // Добавляем поле orders
    }
}
