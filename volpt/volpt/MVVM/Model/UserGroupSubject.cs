using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
    public partial class UserGroupSubject
    {
        public int UserId { get; set; }

        public int GroupId { get; set; }

        public int SubjectId { get; set; }
        public virtual User User { get; set; } = null!;

        public virtual Group Group { get; set; } = null!;

        public virtual Subject Subject { get; set; } = null!;
    }
}
