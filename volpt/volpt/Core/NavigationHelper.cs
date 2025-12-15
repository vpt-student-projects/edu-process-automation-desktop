using System.Windows;
using volpt.MVVM.View;

namespace volpt.Core
{
    public static class NavigationHelper
    {
        public static void NavigateToJournal(int groupId, int subjectId)
        {
			var mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();

			if (mainWindow != null)
			{
				var attendancePage = new AttendancePage(groupId, subjectId);
				mainWindow.MainFrame.Navigate(attendancePage);
			}
			else
			{
				MessageBox.Show("Главное окно не найдено", "Ошибка",
					MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}
    }
}

