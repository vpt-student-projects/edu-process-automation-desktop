using System;
using System.Collections.Generic;

namespace volpt;

public partial class StudentTopic
{
    public int Id { get; set; }

    public int StudentId { get; set; }

    public int TopicId { get; set; }

    public bool? IsSubmitted { get; set; }

    public virtual Student Student { get; set; } = null!;

    public virtual Topic Topic { get; set; } = null!;
}
