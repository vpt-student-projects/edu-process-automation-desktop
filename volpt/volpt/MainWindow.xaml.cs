using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using volpt.AuthService;
using volpt.MVVM.View;
using volpt.MVVM.ViewModel;

namespace volpt
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly AccountService accountService;
        private int _userId;
        public MainWindow(int userId)
        {
            InitializeComponent();
            _userId = userId;
            MainFrame.Navigate(new SchedulePage(_userId));
            var context = new VolpteducationDbContext();
            accountService = new AccountService(context);
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            accountService.LogoutAsync(_userId);
            var loginWindow = new LoginWindow();
            loginWindow.Show();
            Close();
        }

        private void GroupsButton_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new GroupsPage(_userId));
        }

        private void ScheduleButton_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new SchedulePage(_userId));
        }

        public void Navigate(Page page)
        {
            MainFrame.Navigate(page);
        }
    }
}