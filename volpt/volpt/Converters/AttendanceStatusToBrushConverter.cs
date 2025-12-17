using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;
using volpt.MVVM.Model;

namespace volpt.Converters
{
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
}
