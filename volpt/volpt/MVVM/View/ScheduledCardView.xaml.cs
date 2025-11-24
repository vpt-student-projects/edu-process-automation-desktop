using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using volpt.MVVM.Model;

namespace volpt.MVVM.View
{
	public partial class ScheduledCardView : UserControl
	{
		public ScheduledCardView()
		{
			InitializeComponent();
		}

		public DaySchedule Day
		{
			get => (DaySchedule)GetValue(DayProperty);
			set => SetValue(DayProperty, value);
		}

		public static readonly DependencyProperty DayProperty =
			DependencyProperty.Register(nameof(Day),
				typeof(DaySchedule),
				typeof(ScheduledCardView),
				new PropertyMetadata(null, OnDayChanged));

		private static void OnDayChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var control = (ScheduledCardView)d;
			var data = (DaySchedule)e.NewValue;

			if (data == null) return;

			control.day.Text = data.DayName;
			control.date.Text = data.Date;

			control.lessonsList.ItemsSource = data.Lessons;
		}

	}
}

