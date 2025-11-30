using System.Configuration;
using System.Data;
using System.Windows;
using volpt.MVVM.ViewModel;

namespace volpt
{
	public partial class App : Application
	{
		public static MainWindowViewModel MainWindowViewModel { get; private set; }

		protected override void OnStartup(StartupEventArgs e)
		{
			base.OnStartup(e);

			// Создаем главную ViewModel
			MainWindowViewModel = new MainWindowViewModel();
		}
	}
}
