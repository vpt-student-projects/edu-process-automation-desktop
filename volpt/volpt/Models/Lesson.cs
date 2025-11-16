using System;
using System.Collections.Generic;

namespace volpt;

public partial class Lesson
{
    public int Id { get; set; }

    public DateOnly Date { get; set; }

    public int Number { get; set; }

    public int UserId { get; set; }

    public int SubjectId { get; set; }

    public int GroupId { get; set; }

    public int? TopicId { get; set; }

    public string? Classroom { get; set; }

    public string? Comment { get; set; }

    public virtual ICollection<Attendance> Attendances { get; set; } = new List<Attendance>();

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();

    public virtual Group Group { get; set; } = null!;

    public virtual Subject Subject { get; set; } = null!;

    public virtual Topic? Topic { get; set; }

    public virtual User User { get; set; } = null!;
}
