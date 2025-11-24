using System;
using System.Collections.Generic;

namespace volpt;

public partial class Subject
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? TotalHours { get; set; }

    public virtual ICollection<Lesson> Lessons { get; set; } = new List<Lesson>();

    public virtual ICollection<Topic> Topics { get; set; } = new List<Topic>();
}
