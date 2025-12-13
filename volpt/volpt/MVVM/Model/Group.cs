using System;
using System.Collections.Generic;
using volpt.MVVM.Model;

namespace volpt;

public partial class Group
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Lesson> Lessons { get; set; } = new List<Lesson>();

    public virtual ICollection<Student> Students { get; set; } = new List<Student>();
    public virtual ICollection<UserGroupSubject> UserGroupSubjects { get; set; } = new List<UserGroupSubject>();
}
