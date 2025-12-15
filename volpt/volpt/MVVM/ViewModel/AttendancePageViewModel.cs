using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using volpt.Core;
using volpt.MVVM.Model;

namespace volpt.MVVM.ViewModel
{
    /// <summary>
    /// ViewModel страницы ведомости. Загружает оценки и посещаемость по группе/предмету.
    /// </summary>
    public class AttendancePageViewModel : ObservableObject
    {
        private readonly int _groupId;
        private readonly int _subjectId;
        private bool _showPerformance = true;

        public AttendancePageViewModel() : this(0, 0)
        {
        }

        public AttendancePageViewModel(int groupId, int subjectId)
        {
            _groupId = groupId;
            _subjectId = subjectId;

            Dates = new ObservableCollection<DateTime>();
            Students = new ObservableCollection<StudentPerformance>();
            AttendanceStudents = new ObservableCollection<StudentAttendance>();

            _ = LoadAsync();
        }

        /// <summary>
        /// Показывать ли вкладку успеваемости. Вторая вкладка вычисляется как инверсия.
        /// </summary>
        public bool ShowPerformance
        {
            get => _showPerformance;
            set
            {
                if (SetProperty(ref _showPerformance, value))
                {
                    OnPropertyChanged(nameof(ShowAttendance));
                }
            }
        }

        /// <summary>
        /// Показывать ли вкладку посещаемости.
        /// </summary>
        public bool ShowAttendance
        {
            get => !_showPerformance;
            set
            {
                if (SetProperty(ref _showPerformance, !value))
                {
                    OnPropertyChanged(nameof(ShowPerformance));
                }
            }
        }

        public ObservableCollection<DateTime> Dates { get; }
        public ObservableCollection<StudentPerformance> Students { get; }
        public ObservableCollection<StudentAttendance> AttendanceStudents { get; }

        private async Task LoadAsync()
        {
            using var db = new VolpteducationDbContext();

            var lessons = await db.Lessons
                .Include(l => l.Grades)
                .Include(l => l.Attendances)
                    .ThenInclude(a => a.Type)
                .Where(l => l.GroupId == _groupId && l.SubjectId == _subjectId)
                .OrderBy(l => l.Date)
                .ThenBy(l => l.Number)
                .ToListAsync();

            var students = await db.Students
                .Where(s => s.GroupId == _groupId)
                .OrderBy(s => s.FullName)
                .ToListAsync();

            var dates = lessons
                .Select(l => l.Date.ToDateTime(TimeOnly.MinValue))
                .Distinct()
                .OrderBy(d => d)
                .ToList();

            await App.Current.Dispatcher.InvokeAsync(() =>
            {
                Dates.Clear();
                foreach (var d in dates) Dates.Add(d);

                Students.Clear();
                foreach (var st in students)
                {
                    var gradeRecords = new ObservableCollection<GradeRecord>();
                    foreach (var date in dates)
                    {
                        var lessonForDate = lessons
                            .Where(l => l.Date.ToDateTime(TimeOnly.MinValue) == date)
                            .OrderBy(l => l.Number)
                            .FirstOrDefault();

                        var gradeValue = lessonForDate?
                            .Grades
                            .FirstOrDefault(g => g.StudentId == st.Id)
                            ?.Grade1;

                        gradeRecords.Add(new GradeRecord
                        {
                            Date = date,
                            Value = gradeValue?.ToString() ?? string.Empty
                        });
                    }

                    var numericGrades = gradeRecords
                        .Select(g => int.TryParse(g.Value, out var num) ? (int?)num : null)
                        .Where(g => g.HasValue)
                        .Select(g => g.Value)
                        .ToList();

                    Students.Add(new StudentPerformance
                    {
                        FullName = st.FullName,
                        Grades = gradeRecords,
                        AverageGrade = numericGrades.Count > 0 ? numericGrades.Average() : 0
                    });
                }

                AttendanceStudents.Clear();
                foreach (var st in students)
                {
                    var attendanceRecords = new ObservableCollection<AttendanceRecord>();
                    foreach (var date in dates)
                    {
                        var lessonForDate = lessons
                            .Where(l => l.Date.ToDateTime(TimeOnly.MinValue) == date)
                            .OrderBy(l => l.Number)
                            .FirstOrDefault();

                        var attendance = lessonForDate?
                            .Attendances
                            .FirstOrDefault(a => a.StudentId == st.Id);

                        var status = MapAttendanceStatus(attendance);

                        attendanceRecords.Add(new AttendanceRecord
                        {
                            Date = date,
                            Status = status
                        });
                    }

                    var total = attendanceRecords.Count;
                    var presentCount = attendanceRecords.Count(a => a.Status != AttendanceStatus.Absent);

                    AttendanceStudents.Add(new StudentAttendance
                    {
                        FullName = st.FullName,
                        AttendanceRecords = attendanceRecords,
                        AttendancePercentage = total == 0 ? 0 : Math.Round((double)presentCount / total * 100, 1)
                    });
                }
            });
        }

        private AttendanceStatus MapAttendanceStatus(Attendance? attendance)
        {
            if (attendance == null || attendance.Type == null)
                return AttendanceStatus.Present;

            var name = attendance.Type.Name?.ToLowerInvariant() ?? string.Empty;
            if (name.Contains("оп"))
                return AttendanceStatus.Late;
            if (name.Contains("не") || name.Contains("нб") || name.Contains("н/б"))
                return AttendanceStatus.Absent;

            return AttendanceStatus.Present;
        }
    }
}
