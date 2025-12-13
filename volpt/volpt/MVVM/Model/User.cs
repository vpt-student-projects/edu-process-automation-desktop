using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using volpt.MVVM.Model;

namespace volpt;

public partial class User
{
    public int Id { get; set; }

    public string Login { get; set; } = null!;

    public string? PasswordHash { get; set; }

    public string FullName { get; set; } = null!;

    public int RoleId { get; set; }
    public string? RefreshTokenHash { get; set; }
    public DateTime? TokenExpiresAt { get; set; }

    public virtual ICollection<Lesson> Lessons { get; set; } = new List<Lesson>();
    public virtual ICollection<UserGroupSubject> UserGroupSubjects { get; set; } = new List<UserGroupSubject>();

    public virtual Role Role { get; set; } = null!;

    [NotMapped]
    public bool IsTokenValid =>
            !string.IsNullOrEmpty(RefreshTokenHash) &&
            TokenExpiresAt.HasValue &&
            TokenExpiresAt > DateTime.UtcNow;
}
