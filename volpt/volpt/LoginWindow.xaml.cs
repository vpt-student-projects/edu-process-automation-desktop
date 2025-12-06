using System;
using System.Collections.Generic;
using System.Data;
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
using System.Windows.Shapes;
using volpt.AuthService;

namespace volpt.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        private readonly AccountService accountService;
        public LoginWindow()
        {
            InitializeComponent();
            var context = new VolpteducationDbContext();
            accountService = new AccountService(context);
            AutoLogin();
        }
        private async void AutoLogin()
        {
            var user = await accountService.AutoLoginAsync();
            if (user != null)
            {
                var mainWindow = new MainWindow(user.Id);
                mainWindow.Show();
                Close();
            }
        }
        private async void Click_LoginButton(object sender, RoutedEventArgs e)
        {
            var user = await accountService.LoginAsync(LoginTextBox.Text, PasswordBox.Password);
            if (user != null)
            {
            var mainWindow = new MainWindow(user.Id);
            mainWindow.Show();
            Close();
            }
            else
            {
                MessageBox.Show("неверный логин или пароль");
            }
        }
    }
}
