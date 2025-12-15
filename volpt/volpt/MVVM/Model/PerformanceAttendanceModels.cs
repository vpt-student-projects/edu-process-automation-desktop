using System;
using System.Collections.ObjectModel;
using System.Windows.Input;
using volpt.Core;

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
    }

    public class GradeRecord : ObservableObject
    {
        private string _value;

        public DateTime Date { get; set; }
        public string Value
        {
            get => _value;
            set => SetProperty(ref _value, value);
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

	public class AttendanceRecord : ObservableObject
	{
		private AttendanceStatus _status;

		public DateTime Date { get; set; }

		public ICommand ToggleStatusCommand { get; }

		public AttendanceRecord()
		{
			ToggleStatusCommand = new RelayCommand(ToggleStatus);
		}

		public AttendanceStatus Status
		{
			get => _status;
			set
			{
				if (SetProperty(ref _status, value))
				{
					OnPropertyChanged(nameof(Display));
				}
			}
		}

		public string Display => Status switch
		{
			AttendanceStatus.Present => "✓",
			AttendanceStatus.Absent => "н/б",
			AttendanceStatus.Late => "оп",
			_ => string.Empty
		};

		private void ToggleStatus()
		{
			// Цикл: пусто → ✓ → н/б → оп → пусто
			Status = Status switch
			{
				AttendanceStatus.Present => AttendanceStatus.Absent,  // ✓ → н/б
				AttendanceStatus.Absent => AttendanceStatus.Late,     // н/б → оп
				AttendanceStatus.Late => AttendanceStatus.None,       // оп → пусто
				_ => AttendanceStatus.Present                         // пусто → ✓
			};

			// Если нужно другой порядок, например: пусто → н/б → оп → ✓ → пусто
			// Раскомментируйте этот код:
			/*
            Status = Status switch
            {
                AttendanceStatus.None => AttendanceStatus.Absent,     // пусто → н/б
                AttendanceStatus.Absent => AttendanceStatus.Late,     // н/б → оп
                AttendanceStatus.Late => AttendanceStatus.Present,    // оп → ✓
                _ => AttendanceStatus.None                            // ✓ → пусто
            };
            */
		}
	}

	public enum AttendanceStatus
	{
		None,       // пусто
		Present,    // ✓
		Absent,     // н/б
		Late        // оп
	}
}

