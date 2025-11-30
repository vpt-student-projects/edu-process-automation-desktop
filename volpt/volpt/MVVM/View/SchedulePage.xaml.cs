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
using volpt.MVVM.ViewModel;


namespace volpt.MVVM.View
{
    public partial class SchedulePage : Page
    {
		public SchedulePage()
		{
			InitializeComponent();

			// Устанавливаем DataContext из статического свойства App
			if (App.MainWindowViewModel?.ScheduleVM != null)
			{
				this.DataContext = App.MainWindowViewModel.ScheduleVM;
			}
			else
			{
				// Запасной вариант
				this.DataContext = new ScheduleViewModel(2);
			}
		}
	}
}
