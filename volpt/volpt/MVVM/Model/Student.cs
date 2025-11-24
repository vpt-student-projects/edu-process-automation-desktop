using System;
using System.Collections.Generic;

namespace volpt;

public partial class Student
{
    public int Id { get; set; }

    public string FullName { get; set; } = null!;

    public int GroupId { get; set; }

    public virtual ICollection<Attendance> Attendances { get; set; } = new List<Attendance>();

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();

    public virtual Group Group { get; set; } = null!;

    public virtual ICollection<StudentTopic> StudentTopics { get; set; } = new List<StudentTopic>();
}
