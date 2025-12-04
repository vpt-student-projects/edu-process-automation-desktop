using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
    public class GroupModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<SubjectModel> Subjects { get; set; } = new();
        public int StudentCount { get; set; }
        public int LessonCount { get; set; }
    }

}
