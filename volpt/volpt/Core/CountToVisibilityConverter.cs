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
            if (value is string display)
            {
                return display switch
                {
                    "нб" => Brushes.LightCoral,        // не был
                    "оп" => Brushes.LightGoldenrodYellow, // опоздал
                    "уш" => Brushes.Orange,            // ушёл раньше
                    "ув" => Brushes.LightBlue,         // уважительная причина
                    "от" => Brushes.LightCyan,         // отпуск
                    "✓" => Brushes.LightGreen,        // присутствовал
                    _ => Brushes.Transparent
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
            if (value is string display)
            {
                return display switch
                {
                    "нб" => Brushes.DarkRed,           // не был
                    "оп" => Brushes.DarkGoldenrod,     // опоздал
                    "уш" => Brushes.Brown,        // ушёл раньше
                    "ув" => Brushes.DarkBlue,          // уважительная причина
                    "от" => Brushes.DarkCyan,          // отпуск
                    "✓" => Brushes.DarkGreen,         // присутствовал
                    _ => Brushes.Black
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