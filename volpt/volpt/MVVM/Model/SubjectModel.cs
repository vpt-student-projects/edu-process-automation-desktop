using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
    public class SubjectModel
    {
        public int Id { get; set; }
        public string Code { get; set; } // например "МДК 02.03"
        public string Title { get; set; }
        public int TotalHours { get; set; }
        public bool IsMdk => Code?.Contains("МДК") ?? false;

        // Для отображения полного названия
        public string DisplayName => string.IsNullOrEmpty(Code)
            ? Title
            : $"{Code} {Title}";
    }
}
