using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace volpt;

public partial class VolpteducationDbContext : DbContext
{
    public VolpteducationDbContext()
    {
    }

    public VolpteducationDbContext(DbContextOptions<VolpteducationDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Attendance> Attendances { get; set; }

    public virtual DbSet<AttendanceType> AttendanceTypes { get; set; }

    public virtual DbSet<Grade> Grades { get; set; }

    public virtual DbSet<Group> Groups { get; set; }

    public virtual DbSet<Lesson> Lessons { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<StudentTopic> StudentTopics { get; set; }

    public virtual DbSet<Subject> Subjects { get; set; }

    public virtual DbSet<Topic> Topics { get; set; }

    public virtual DbSet<TopicType> TopicTypes { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Server=localhost;Port=5432;Database=VolptEDUDB;Username=postgres;Password=sa");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Attendance>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Attendance_pkey");

            entity.ToTable("Attendance");

            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.Lesson).WithMany(p => p.Attendances)
                .HasForeignKey(d => d.LessonId)
                .HasConstraintName("FK_Attendance_LessonId");

            entity.HasOne(d => d.Student).WithMany(p => p.Attendances)
                .HasForeignKey(d => d.StudentId)
                .HasConstraintName("FK_Attendance_StudentId");

            entity.HasOne(d => d.Type).WithMany(p => p.Attendances)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_Attendance_TypeId");
        });

        modelBuilder.Entity<AttendanceType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("AttendanceType_pkey");

            entity.ToTable("AttendanceType");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        modelBuilder.Entity<Grade>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Grade_pkey");

            entity.ToTable("Grade");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Grade1).HasColumnName("Grade");

            entity.HasOne(d => d.Lesson).WithMany(p => p.Grades)
                .HasForeignKey(d => d.LessonId)
                .HasConstraintName("FK_Grade_LessonId");

            entity.HasOne(d => d.Student).WithMany(p => p.Grades)
                .HasForeignKey(d => d.StudentId)
                .HasConstraintName("FK_Grade_StudentId");
        });

        modelBuilder.Entity<Group>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Group_pkey");

            entity.ToTable("Group");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        modelBuilder.Entity<Lesson>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Lesson_pkey");

            entity.ToTable("Lesson");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Classroom).HasColumnType("character varying");
            entity.Property(e => e.Comment).HasColumnType("character varying");

            entity.HasOne(d => d.Group).WithMany(p => p.Lessons)
                .HasForeignKey(d => d.GroupId)
                .HasConstraintName("FK_Lesson_GroupId");

            entity.HasOne(d => d.Subject).WithMany(p => p.Lessons)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK_Lesson_SubjectId");

            entity.HasOne(d => d.Topic).WithMany(p => p.Lessons)
                .HasForeignKey(d => d.TopicId)
                .HasConstraintName("FK_Lesson_TopicId");

            entity.HasOne(d => d.User).WithMany(p => p.Lessons)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_Lesson_UserId");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Role_pkey");

            entity.ToTable("Role");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name).HasMaxLength(30);
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Student_pkey");

            entity.ToTable("Student");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.FullName).HasColumnType("character varying");

            entity.HasOne(d => d.Group).WithMany(p => p.Students)
                .HasForeignKey(d => d.GroupId)
                .HasConstraintName("FK_Student_GroupId");
        });

        modelBuilder.Entity<StudentTopic>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("StudentTopic_pkey");

            entity.ToTable("StudentTopic");

            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.Student).WithMany(p => p.StudentTopics)
                .HasForeignKey(d => d.StudentId)
                .HasConstraintName("FK_StudentTopic_StudentId");

            entity.HasOne(d => d.Topic).WithMany(p => p.StudentTopics)
                .HasForeignKey(d => d.TopicId)
                .HasConstraintName("FK_StudentTopic_TopicId");
        });

        modelBuilder.Entity<Subject>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Subject_pkey");

            entity.ToTable("Subject");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name).HasColumnType("character varying");
            entity.Property(e => e.TotalHours).HasColumnName("Total_hours");
        });

        modelBuilder.Entity<Topic>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Topic_pkey");

            entity.ToTable("Topic");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Homework).HasColumnType("character varying");
            entity.Property(e => e.Name).HasColumnType("character varying");

            entity.HasOne(d => d.Subject).WithMany(p => p.Topics)
                .HasForeignKey(d => d.SubjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Topic_SubjectId");

            entity.HasOne(d => d.Type).WithMany(p => p.Topics)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_Topic_TypeId");
        });

        modelBuilder.Entity<TopicType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("TopicType_pkey");

            entity.ToTable("TopicType");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("User_pkey");

            entity.ToTable("User");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.FullName).HasColumnType("character varying");
            entity.Property(e => e.Login).HasColumnType("character varying");
            entity.Property(e => e.PasswordHash).HasColumnType("character varying");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_User_RoleId");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
