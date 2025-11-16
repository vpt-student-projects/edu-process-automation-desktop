using System;
using System.Collections.Generic;

namespace volpt;

public partial class TopicType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Topic> Topics { get; set; } = new List<Topic>();
}
