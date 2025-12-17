using System;
using System.Collections.ObjectModel;
using System.Windows;
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
            try
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
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при расчете средней оценки");
                AverageGrade = 0;
            }
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
            SaveCommand = new RelayCommand(async () =>
            {
                try
                {
                    await saveAction(this);
                }
                catch
                {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при сохранении оценки");
                }
            });
        }

        public string Value
        {
            get => _value;
            set
            {
                try
                {
                    if (SetProperty(ref _value, value) && !_isInitializing)
                    {
                        // Вызываем команду сохранения ТОЛЬКО если не инициализация
                        if (SaveCommand.CanExecute(null))
                            SaveCommand.Execute(null);
                    }
                }
                catch
                {
                     ErrorMessageHelper.ShowErrorMessage("Ошибка при установке значения оценки");
                }
            }
        }

        // Метод для завершения инициализации
        public void FinishInitialization()
        {
            try
            {
                _isInitializing = false;
            }
            catch
            {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при завершении инициализации");
            }
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

        public void RecalculateAttendancePercentage()
        {
            try
            {
                if (AttendanceRecords == null || AttendanceRecords.Count == 0)
                {
                    AttendancePercentage = 0;
                    return;
                }

                int presentCount = AttendanceRecords.Count(r => r?.IsPresent == true);
                AttendancePercentage = Math.Round((double)presentCount / AttendanceRecords.Count * 100, 1);
            }
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при расчете процента посещаемости");
                AttendancePercentage = 0;
            }
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
                try
                {
                    _attendanceTypes = value;
                    OnPropertyChanged(nameof(Display));
                    OnPropertyChanged(nameof(ToolTipText));
                }
                catch
                {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при установке типов посещаемости");
                }
            }
        }

        // ID типа посещаемости (null = присутствовал)
        public int? AttendanceTypeId
        {
            get => _attendanceTypeId;
            set
            {
                try
                {
                    if (SetProperty(ref _attendanceTypeId, value))
                    {
                        OnPropertyChanged(nameof(Display));
                        OnPropertyChanged(nameof(IsPresent));
                        OnPropertyChanged(nameof(ToolTipText));
                        OnStatusChanged?.Invoke(StudentId);
                    }
                }
                catch
                {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при изменении статуса посещаемости");
                }
            }
        }

        // Команда для переключения статуса
        public ICommand ToggleStatusCommand { get; }

        // Действие при изменении статуса (для обновления процента)
        public Action<int> OnStatusChanged { get; set; }

        // Определяем, считается ли присутствием (ур и от - уважительные причины)
        public bool IsPresent
        {
            get
            {
                try
                {
                    return AttendanceTypeId == null ||
                           AttendanceTypeId == 4 || // уважительная причина
                           AttendanceTypeId == 5;   // отпуск
                }
                catch
                {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при определении статуса присутствия");
                    return false;
                }
            }
        }

        // Отображение в ячейке
        public string Display
        {
            get
            {
                try
                {
                    return AttendanceTypeId switch
                    {
                        1 => "нб",  // не был
                        2 => "оп",  // опоздал
                        3 => "уш",  // ушёл раньше
                        4 => "ув",  // уважительная причина
                        5 => "от",  // отпуск
                        _ => "✓"    // присутствовал (null или нет записи)
                    };
                }
                catch
                {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при получении отображения статуса");
                    return "?";
                }
            }
        }

        // Подсказка при наведении
        public string ToolTipText
        {
            get
            {
                try
                {
                    return $"Текущий статус: {GetCurrentStatusName()}\nКлик для смены на: {GetNextStatusName()}";
                }
                catch
                {
                    ErrorMessageHelper.ShowErrorMessage("Ошибка при получении подсказки");
                    return "Ошибка загрузки данных";
                }
            }
        }

        public AttendanceRecord()
        {
            try
            {
                ToggleStatusCommand = new RelayCommand(ToggleStatus);
            }
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при создании команды переключения статуса");
                ToggleStatusCommand = new RelayCommand(() => { });
            }
        }

        private void ToggleStatus()
        {
            try
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
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при переключении статуса посещаемости");
            }
        }

        private List<AttendanceType> GetAttendanceTypesInOrder()
        {
            try
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
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при получении списка типов посещаемости");
                return new List<AttendanceType>();
            }
        }

        private string GetCurrentStatusName()
        {
            try
            {
                if (AttendanceTypeId == null)
                    return "Присутствовал";

                var type = _attendanceTypes?.FirstOrDefault(t => t.Id == AttendanceTypeId);
                return type?.Name ?? "Присутствовал";
            }
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при получении текущего статуса");
                return "Ошибка";
            }
        }

        private string GetNextStatusName()
        {
            try
            {
                if (_attendanceTypes == null || _attendanceTypes.Count == 0)
                    return "Нет данных";

                var typesInOrder = GetAttendanceTypesInOrder();
                int currentIndex = typesInOrder.FindIndex(t => t.Id == (AttendanceTypeId ?? 0));
                int nextIndex = (currentIndex + 1) % typesInOrder.Count;

                return typesInOrder[nextIndex].Name;
            }
            catch
            {
                ErrorMessageHelper.ShowErrorMessage("Ошибка при получении следующего статуса");
                return "Ошибка";
            }
        }
    }

    // Вспомогательный класс для отображения сообщений об ошибках
    public static class ErrorMessageHelper
    {
        public static void ShowErrorMessage(string message)
        {
            Application.Current?.Dispatcher?.Invoke(() =>
            {
                MessageBox.Show(
                    message,
                    "Ошибка",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            });
        }
    }
}