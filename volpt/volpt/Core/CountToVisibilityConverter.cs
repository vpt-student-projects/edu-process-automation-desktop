using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;
using volpt.MVVM.Model;

namespace volpt.Core
{
    public class CountToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value is int count && count > 0 ? Visibility.Visible : Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

	public class InverseCountToVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value is int count)
				return count == 0 ? Visibility.Visible : Visibility.Collapsed;
			if (value is bool boolValue)
				return boolValue ? Visibility.Collapsed : Visibility.Visible;

			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class LessonSlotToBackgroundConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value is bool hasLesson && hasLesson)
				return Brushes.Transparent;
			else
				return new SolidColorBrush(Color.FromArgb(30, 128, 128, 128));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class LessonSlotToBorderBrushConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value is bool hasLesson && hasLesson)
				return new SolidColorBrush(Color.FromRgb(86, 125, 184));
			else
				return new SolidColorBrush(Color.FromArgb(50, 128, 128, 128));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class LessonSlotToOpacityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value is bool hasLesson && hasLesson ? 1.0 : 0.6;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
    public class BoolToAngleConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is bool isExpanded)
            {
                return isExpanded ? 0 : -90; // 180° - стрелка вниз, 90° - стрелка вправо
            }
            return 90;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
    public class BoolToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is bool boolValue)
                return boolValue ? Visibility.Visible : Visibility.Collapsed;
            return Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
    public class AttendanceStatusToBrushConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is AttendanceRecord record)
            {
                return record.AttendanceTypeId switch
                {
                    1 => Brushes.LightCoral,        // нб - светло-красный
                    2 => Brushes.LightGoldenrodYellow, // оп - светло-желтый
                    3 => Brushes.Orange,            // уш - оранжевый
                    4 => Brushes.LightBlue,         // ур - светло-синий
                    5 => Brushes.LightCyan,         // от - голубой
                    _ => Brushes.LightGreen         // ✓ - светло-зеленый
                };
            }
            return Brushes.Transparent;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public class AttendanceStatusToForegroundConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is AttendanceRecord record)
            {
                return record.AttendanceTypeId switch
                {
                    1 => Brushes.DarkRed,           // нб - темно-красный
                    2 => Brushes.DarkGoldenrod,     // оп - темно-желтый
                    3 => Brushes.DarkOrange,        // уш - темно-оранжевый
                    4 => Brushes.DarkBlue,          // ур - темно-синий
                    5 => Brushes.DarkCyan,          // от - темно-голубой
                    _ => Brushes.DarkGreen          // ✓ - темно-зеленый
                };
            }
            return Brushes.Black;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}