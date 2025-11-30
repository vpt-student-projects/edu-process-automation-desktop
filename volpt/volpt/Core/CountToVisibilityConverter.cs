using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

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
}