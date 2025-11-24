using System;
using System.Collections.Generic;

namespace volpt;

public partial class Attendance
{
    public int Id { get; set; }

    public int LessonId { get; set; }

    public int StudentId { get; set; }

    public int? TypeId { get; set; }

    public virtual Lesson Lesson { get; set; } = null!;

    public virtual Student Student { get; set; } = null!;

    public virtual AttendanceType? Type { get; set; }
}
