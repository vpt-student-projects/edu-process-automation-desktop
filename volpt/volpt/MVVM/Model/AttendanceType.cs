using System;
using System.Collections.Generic;

namespace volpt;

public partial class AttendanceType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Attendance> Attendances { get; set; } = new List<Attendance>();
}
