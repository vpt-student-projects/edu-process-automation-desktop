using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;
using volpt.MVVM.Model;

namespace volpt.Converters
{
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
