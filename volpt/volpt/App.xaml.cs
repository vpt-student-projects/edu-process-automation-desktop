using System.Windows;
using volpt.AuthService;
using volpt.MVVM.View;

namespace volpt
{
    public partial class App : Application
    {


        protected override async void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            try
            {
                // Создаем контекст базы данных
                using var dbContext = new VolpteducationDbContext();

                // Создаем сервис аккаунта с передачей контекста
                var accountService = new AccountService(dbContext);
                var user = await accountService.AutoLoginAsync();

                if (user != null)
                {
                    // Автоматический вход успешен
                    var mainWindow = new MainWindow(user.Id);
                    mainWindow.Show();
                    MainWindow = mainWindow;
                }
                else
                {
                    // Показываем окно входа
                    var loginWindow = new LoginWindow();
                    loginWindow.Show();
                    MainWindow = loginWindow;
                }

               
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при запуске: {ex.Message}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                Shutdown();
            }
        }
    }
}
