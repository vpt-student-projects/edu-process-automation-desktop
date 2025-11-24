using System;
using System.Collections.Generic;

namespace volpt;

public partial class Topic
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public int? TypeId { get; set; }

    public int SubjectId { get; set; }

    public string? Homework { get; set; }

    public virtual ICollection<Lesson> Lessons { get; set; } = new List<Lesson>();

    public virtual ICollection<StudentTopic> StudentTopics { get; set; } = new List<StudentTopic>();

    public virtual Subject Subject { get; set; } = null!;

    public virtual TopicType? Type { get; set; }
}
