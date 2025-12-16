using System;
using System.Collections.ObjectModel;
using System.Windows.Input;
using volpt.Core;
using volpt.MVVM.ViewModel;

namespace volpt.MVVM.Model
{
    // Модель строки успеваемости
    public class StudentPerformance : ObservableObject
    {
        private double _averageGrade;

        public string FullName { get; set; }
        public ObservableCollection<GradeRecord> Grades { get; set; } = new();

        public double AverageGrade
        {
            get => _averageGrade;
            set => SetProperty(ref _averageGrade, value);
        }
        public void RecalculateAverage()
        {
            var numericGrades = Grades
                .Select(g => int.TryParse(g.Value, out var num) ? (int?)num : null)
                .Where(g => g.HasValue)
                .Select(g => g.Value)
                .ToList();

            AverageGrade = numericGrades.Count > 0
                ? Math.Round(numericGrades.Average(), 2)
                : 0;
        }
    }

    public class GradeRecord : ObservableObject
    {
        private string _value;
        private bool _isInitializing = true; // Добавь флаг инициализации

        public DateTime Date { get; set; }
        public int LessonId { get; set; }
        public int StudentId { get; set; }
        public ICommand SaveCommand { get; }

        public GradeRecord(Func<GradeRecord, Task> saveAction)
        {
            SaveCommand = new RelayCommand(async () => await saveAction(this));
        }

        public string Value
        {
            get => _value;
            set
            {
                if (SetProperty(ref _value, value) && !_isInitializing)
                {
                    // Вызываем команду сохранения ТОЛЬКО если не инициализация
                    if (SaveCommand.CanExecute(null))
                        SaveCommand.Execute(null);
                }
            }
        }

        // Метод для завершения инициализации
        public void FinishInitialization()
        {
            _isInitializing = false;
        }
    }

    // Модель строки посещаемости
    public class StudentAttendance : ObservableObject
    {
        private double _attendancePercentage;

        public string FullName { get; set; }
        public ObservableCollection<AttendanceRecord> AttendanceRecords { get; set; } = new();

        public double AttendancePercentage
        {
            get => _attendancePercentage;
            set => SetProperty(ref _attendancePercentage, value);
        }
    }

    // Модель записи посещаемости с поддержкой типов из БД
    public class AttendanceRecord : ObservableObject
    {
        private int? _attendanceTypeId;
        private List<AttendanceType> _attendanceTypes;

        public DateTime Date { get; set; }
        public int LessonId { get; set; }
        public int StudentId { get; set; }

        // Ссылка на список всех типов посещаемости
        public List<AttendanceType> AttendanceTypes
        {
            get => _attendanceTypes;
            set
            {
                _attendanceTypes = value;
                OnPropertyChanged(nameof(Display));
                OnPropertyChanged(nameof(ToolTipText));
            }
        }

        // ID типа посещаемости (null = присутствовал)
        public int? AttendanceTypeId
        {
            get => _attendanceTypeId;
            set
            {
                if (SetProperty(ref _attendanceTypeId, value))
                {
                    OnPropertyChanged(nameof(Display));
                    OnPropertyChanged(nameof(IsPresent));
                    OnPropertyChanged(nameof(ToolTipText));
                    OnStatusChanged?.Invoke(StudentId);
                }
            }
        }

        // Команда для переключения статуса
        public ICommand ToggleStatusCommand { get; }

        // Действие при изменении статуса (для обновления процента)
        public Action<int> OnStatusChanged { get; set; }

        // Определяем, считается ли присутствием (ур и от - уважительные причины)
        public bool IsPresent => AttendanceTypeId == null ||
                                AttendanceTypeId == 4 || // уважительная причина
                                AttendanceTypeId == 5;   // отпуск

        // Отображение в ячейке
        public string Display => AttendanceTypeId switch
        {
            1 => "нб",  // не был
            2 => "оп",  // опоздал
            3 => "уш",  // ушёл раньше
            4 => "ув",  // уважительная причина
            5 => "от",  // отпуск
            _ => "✓"    // присутствовал (null или нет записи)
        };

        // Подсказка при наведении
        public string ToolTipText => $"Текущий статус: {GetCurrentStatusName()}\nКлик для смены на: {GetNextStatusName()}";

        public AttendanceRecord()
        {
            ToggleStatusCommand = new RelayCommand(ToggleStatus);
        }

        private void ToggleStatus()
        {
            if (_attendanceTypes == null || _attendanceTypes.Count == 0)
                return;

            // Определяем порядок переключения
            var typesInOrder = GetAttendanceTypesInOrder();

            // Находим текущий индекс
            int currentIndex = -1;
            for (int i = 0; i < typesInOrder.Count; i++)
            {
                if (typesInOrder[i].Id == (AttendanceTypeId ?? 0))
                {
                    currentIndex = i;
                    break;
                }
            }

            // Переходим к следующему (циклически)
            int nextIndex = (currentIndex + 1) % typesInOrder.Count;

            // Получаем следующий тип
            var nextType = typesInOrder[nextIndex];

            // Устанавливаем новый тип (0 = отсутствие записи = присутствовал)
            AttendanceTypeId = nextType.Id > 0 ? nextType.Id : (int?)null;
        }

        private List<AttendanceType> GetAttendanceTypesInOrder()
        {
            // Порядок переключения: ✓ → нб → оп → уш → ур → от → ✓
            var result = new List<AttendanceType>();

            // Добавляем "пустое" (присутствовал) - Id = 0
            result.Add(new AttendanceType { Id = 0, Name = "Присутствовал" });

            // Добавляем остальные в нужном порядке
            if (_attendanceTypes != null)
            {
                foreach (var type in _attendanceTypes.OrderBy(t => t.Id))
                {
                    result.Add(type);
                }
            }

            return result;
        }

        private string GetCurrentStatusName()
        {
            if (AttendanceTypeId == null)
                return "Присутствовал";

            var type = _attendanceTypes?.FirstOrDefault(t => t.Id == AttendanceTypeId);
            return type?.Name ?? "Присутствовал";
        }

        private string GetNextStatusName()
        {
            if (_attendanceTypes == null || _attendanceTypes.Count == 0)
                return "Нет данных";

            var typesInOrder = GetAttendanceTypesInOrder();
            int currentIndex = typesInOrder.FindIndex(t => t.Id == (AttendanceTypeId ?? 0));
            int nextIndex = (currentIndex + 1) % typesInOrder.Count;

            return typesInOrder[nextIndex].Name;
        }
    }
}

