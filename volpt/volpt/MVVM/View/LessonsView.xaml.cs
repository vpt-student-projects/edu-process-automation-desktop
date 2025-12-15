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
using volpt.Core;

namespace volpt.MVVM.View
{
	public partial class LessonsView : UserControl
	{
		public LessonsView()
		{
			InitializeComponent();
		}

		public LessonItem Lesson
		{
			get => (LessonItem)GetValue(LessonProperty);
			set => SetValue(LessonProperty, value);
		}

		public static readonly DependencyProperty LessonProperty =
			DependencyProperty.Register(nameof(Lesson), typeof(LessonItem), typeof(LessonsView));


		private void Lesson_Click(object sender, RoutedEventArgs e)
		{
			if (Lesson == null)
			{
				MessageBox.Show("Lesson is null!");
				return;
			}

			NavigationHelper.NavigateToJournal(Lesson.GroupId, Lesson.SubjectId);
		}
	}
}

