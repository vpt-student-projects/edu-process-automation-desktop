using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using volpt;
using volpt.Core;
using volpt.MVVM.Model;
using System.Windows;

namespace volpt.MVVM.ViewModel
{
    /// <summary>
    /// ViewModel страницы ведомости. Загружает оценки и посещаемость по группе/предмету.
    /// </summary>
    public class AttendancePageViewModel : ObservableObject
    {
        private const int PageSize = 18;

        private readonly int _groupId;
        private readonly int _subjectId;
        private bool _showPerformance = true;

        // Полные данные для построения страниц
        private List<Lesson> _allLessons = new();
        private List<Student> _allStudents = new();
        private List<AttendanceType> _attendanceTypes = new();
        private List<DateTime> _allDates = new();

        private int _currentPage = 1;
        private int _totalPages;
        private DateTime? _pageStartDate;
        private DateTime? _pageEndDate;

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

            PrevPageCommand = new RelayCommand(PrevPage, () => CurrentPage > 1);
            NextPageCommand = new RelayCommand(NextPage, () => CurrentPage < TotalPages);

            _ = LoadAsync();
        }

        public List<string> GradesList { get; } = new List<string> { string.Empty, "2", "3", "4", "5" };

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

        public int CurrentPage
        {
            get => _currentPage;
            set => SetProperty(ref _currentPage, value);
        }

        public int TotalPages
        {
            get => _totalPages;
            set => SetProperty(ref _totalPages, value);
        }

        public DateTime? PageStartDate
        {
            get => _pageStartDate;
            set => SetProperty(ref _pageStartDate, value);
        }

        public DateTime? PageEndDate
        {
            get => _pageEndDate;
            set => SetProperty(ref _pageEndDate, value);
        }

        public ICommand PrevPageCommand { get; }
        public ICommand NextPageCommand { get; }

        private void PrevPage()
        {
            try
            {
                if (CurrentPage <= 1) return;
                CurrentPage--;
                BuildPage(CurrentPage);
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при переходе на предыдущую страницу");
            }
        }

        private void NextPage()
        {
            try
            {
                if (CurrentPage >= TotalPages) return;
                CurrentPage++;
                BuildPage(CurrentPage);
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при переходе на следующую страницу");
            }
        }

        private async Task LoadAsync()
        {
            try
            {
                using var db = new VolpteducationDbContext();

                // Подгружаем занятия, студентов и типы посещаемости для выбранной группы/предмета
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

                var attendanceTypes = await db.AttendanceTypes
                    .OrderBy(t => t.Id)
                    .ToListAsync();

                var dates = lessons
                    .Select(l => l.Date.ToDateTime(TimeOnly.MinValue))
                    .Distinct()
                    .OrderBy(d => d)
                    .ToList();

                // Кэшируем полные данные для постраничной навигации
                _allLessons = lessons;
                _allStudents = students;
                _attendanceTypes = attendanceTypes;
                _allDates = dates;

                CurrentPage = 1;
                TotalPages = _allDates.Count == 0
                    ? 1
                    : (int)Math.Ceiling(_allDates.Count / (double)PageSize);

                await App.Current.Dispatcher.InvokeAsync(() =>
                {
                    try
                    {
                        BuildPage(CurrentPage);
                    }
                    catch (Exception ex)
                    {
                        HandleError("Ошибка при построении страницы");
                    }
                });
            }
            catch (DbUpdateException dbEx)
            {
                HandleError("Ошибка обновления базы данных при загрузке данных");
            }
            catch (InvalidOperationException ioEx)
            {
                HandleError("Ошибка операции с базой данных");
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при загрузке данных");
            }
        }

        private void BuildPage(int page)
        {
            try
            {
                if (_allDates == null || _allDates.Count == 0)
                {
                    Dates.Clear();
                    Students.Clear();
                    AttendanceStudents.Clear();
                    PageStartDate = null;
                    PageEndDate = null;
                    return;
                }

                if (page < 1 || page > TotalPages)
                {
                    throw new ArgumentOutOfRangeException(nameof(page), $"Номер страницы должен быть от 1 до {TotalPages}");
                }

                var pageDates = _allDates
                    .Skip((page - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                PageStartDate = pageDates.FirstOrDefault();
                PageEndDate = pageDates.LastOrDefault();

                Dates.Clear();
                foreach (var d in pageDates)
                    Dates.Add(d);

                Students.Clear();
                AttendanceStudents.Clear();

                foreach (var st in _allStudents)
                {
                    var gradeRecords = new ObservableCollection<GradeRecord>();
                    foreach (var date in pageDates)
                    {
                        try
                        {
                            var lessonForDate = _allLessons
                                .Where(l => l.Date.ToDateTime(TimeOnly.MinValue) == date)
                                .OrderBy(l => l.Number)
                                .FirstOrDefault();

                            var gradeValue = lessonForDate?
                                .Grades
                                .FirstOrDefault(g => g.StudentId == st.Id)
                                ?.Grade1;

                            var record = new GradeRecord(SaveGradeAsync)
                            {
                                Date = date,
                                LessonId = lessonForDate?.Id ?? 0,
                                StudentId = st.Id,
                                Value = gradeValue?.ToString() ?? string.Empty
                            };
                            record.FinishInitialization();
                            gradeRecords.Add(record);
                        }
                        catch (Exception ex)
                        {
                            HandleError($"Ошибка при создании записи оценки для студента {st.FullName} на дату {date:dd.MM.yyyy}");
                            continue;
                        }
                    }

                    try
                    {
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
                    catch (Exception ex)
                    {
                        HandleError($"Ошибка при расчете средней оценки для студента {st.FullName}");
                        Students.Add(new StudentPerformance
                        {
                            FullName = st.FullName,
                            Grades = gradeRecords,
                            AverageGrade = 0
                        });
                    }

                    var attendanceRecords = new ObservableCollection<AttendanceRecord>();

                    foreach (var date in pageDates)
                    {
                        try
                        {
                            var lessonForDate = _allLessons
                                .Where(l => l.Date.ToDateTime(TimeOnly.MinValue) == date)
                                .OrderBy(l => l.Number)
                                .FirstOrDefault();

                            var attendance = lessonForDate?
                                .Attendances
                                .FirstOrDefault(a => a.StudentId == st.Id);

                            var record = new AttendanceRecord
                            {
                                Date = date,
                                LessonId = lessonForDate?.Id ?? 0,
                                StudentId = st.Id,
                                AttendanceTypes = _attendanceTypes,
                                AttendanceTypeId = attendance?.TypeId
                            };

                            attendanceRecords.Add(record);
                        }
                        catch (Exception ex)
                        {
                            HandleError($"Ошибка при создании записи посещаемости для студента {st.FullName} на дату {date:dd.MM.yyyy}");
                            continue;
                        }
                    }

                    try
                    {
                        var studentAttendance = new StudentAttendance
                        {
                            FullName = st.FullName,
                            AttendanceRecords = attendanceRecords
                        };

                        void Recalculate()
                        {
                            try
                            {
                                var total = studentAttendance.AttendanceRecords.Count;
                                var presentCount = studentAttendance.AttendanceRecords.Count(r => r.IsPresent);
                                studentAttendance.AttendancePercentage = total == 0
                                    ? 0
                                    : Math.Round((double)presentCount / total * 100, 1);
                            }
                            catch (Exception ex)
                            {
                                HandleError($"Ошибка при пересчете процента посещаемости для студента {st.FullName}");
                                studentAttendance.AttendancePercentage = 0;
                            }
                        }

                        foreach (var record in attendanceRecords)
                        {
                            record.OnStatusChanged = __ =>
                            {
                                try
                                {
                                    Recalculate();
                                    _ = Task.Run(() => SaveAttendanceAsync(record));
                                }
                                catch (Exception ex)
                                {
                                    HandleError($"Ошибка при обработке изменения статуса посещаемости");
                                }
                            };
                        }

                        Recalculate();
                        AttendanceStudents.Add(studentAttendance);
                    }
                    catch (Exception ex)
                    {
                        HandleError($"Ошибка при добавлении студента {st.FullName} в список посещаемости");
                    }
                }
            }
            catch (Exception ex)
            {
                HandleError("Критическая ошибка при построении страницы");
                Dates.Clear();
                Students.Clear();
                AttendanceStudents.Clear();
            }
        }

        private void UpdateStudentAverage(int studentId)
        {
            try
            {
                var studentPerformance = Students.FirstOrDefault(s =>
                    s.Grades.Any(g => g.StudentId == studentId));

                if (studentPerformance != null)
                {
                    studentPerformance.RecalculateAverage();
                }
            }
            catch (Exception ex)
            {
                HandleError($"Ошибка при обновлении средней оценки для студента ID={studentId}");
            }
        }

        private async Task SaveGradeAsync(GradeRecord record)
        {
            try
            {
                if (record.LessonId == 0 || record.StudentId == 0)
                    return;

                using var db = new VolpteducationDbContext();

                var gradeEntity = await db.Grades
                    .FirstOrDefaultAsync(g => g.LessonId == record.LessonId && g.StudentId == record.StudentId);

                if (string.IsNullOrWhiteSpace(record.Value))
                {
                    if (gradeEntity != null)
                    {
                        db.Grades.Remove(gradeEntity);
                        await db.SaveChangesAsync();
                    }
                    return;
                }

                if (!int.TryParse(record.Value, out var parsed))
                    return;

                if (gradeEntity == null)
                {
                    gradeEntity = new Grade
                    {
                        LessonId = record.LessonId,
                        StudentId = record.StudentId,
                        Grade1 = parsed
                    };
                    db.Grades.Add(gradeEntity);
                }
                else
                {
                    gradeEntity.Grade1 = parsed;
                }

                await db.SaveChangesAsync();
                UpdateStudentAverage(record.StudentId);
            }
            catch (DbUpdateException dbEx)
            {
                HandleError("Ошибка базы данных при сохранении оценки");
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при сохранении оценки");
            }
        }

        private async Task SaveAttendanceAsync(AttendanceRecord record)
        {
            try
            {
                if (record.LessonId == 0 || record.StudentId == 0)
                    return;

                using var db = new VolpteducationDbContext();

                var entity = await db.Attendances
                    .FirstOrDefaultAsync(a => a.LessonId == record.LessonId && a.StudentId == record.StudentId);

                if (record.AttendanceTypeId == null)
                {
                    if (entity != null)
                    {
                        db.Attendances.Remove(entity);
                        await db.SaveChangesAsync();
                    }
                    return;
                }

                if (entity == null)
                {
                    entity = new Attendance
                    {
                        LessonId = record.LessonId,
                        StudentId = record.StudentId,
                        TypeId = record.AttendanceTypeId
                    };
                    db.Attendances.Add(entity);
                }
                else
                {
                    entity.TypeId = record.AttendanceTypeId;
                }

                await db.SaveChangesAsync();
            }
            catch (DbUpdateException dbEx)
            {
                HandleError("Ошибка базы данных при сохранении посещаемости");
            }
            catch (Exception ex)
            {
                HandleError("Ошибка при сохранении посещаемости");
            }
        }

        /// <summary>
        /// Универсальный обработчик ошибок
        /// </summary>
        private void HandleError(string message)
        {
            Application.Current.Dispatcher.Invoke(() =>
            {
                MessageBox.Show(
                    $"{message}\n",
                    "Ошибка",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            });       
        }
    }
}