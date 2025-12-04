using System;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using volpt.MVVM.Model;

namespace volpt.AuthService
{
    public class AuthService
    {
        private readonly VolpteducationDbContext _context;

        public AuthService(VolpteducationDbContext context)
        {
            _context = context;
        }

        // 1. ВХОД С ПАРОЛЕМ
        public async Task<User> LoginAsync(string login, string password, bool rememberMe = false)
        {
            // Находим пользователя
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.Login == login);

            if (user == null)
                return null;

            // Проверяем пароль (используем BCrypt)
            if (!BCrypt.Net.BCrypt.Verify(password, user.PasswordHash))
                return null;

            // Генерируем и сохраняем токен, если выбрано "Запомнить меня"
            if (rememberMe)
            {
                await SaveRefreshTokenAsync(user);
            }
            else
            {
                // Если не "запомнить меня" - очищаем старые токены
                ClearUserTokens(user);
            }

            await _context.SaveChangesAsync();
            return user;
        }

        // 2. АВТОМАТИЧЕСКИЙ ВХОД (при запуске приложения)
        //public async Task<User> AutoLoginAsync()
        //{
        //    // Загружаем токен из локального хранилища
        //    var savedToken = await LoadTokenFromStorageAsync();
        //    if (string.IsNullOrEmpty(savedToken))
        //        return null;

        //    // Находим пользователя по токену
        //    var tokenHash = HashToken(savedToken);
        //    var user = await _context.Users
        //        .FirstOrDefaultAsync(u => u.RefreshTokenHash == tokenHash);

        //    if (user == null || !user.IsTokenValid)
        //    {
        //        await ClearTokenFromStorageAsync();
        //        return null;
        //    }

        //    // Обновляем время истечения токена (продлеваем сессию)
        //    user.TokenExpiresAt = DateTime.UtcNow.AddDays(7);
        //    await _context.SaveChangesAsync();

        //    // Сохраняем обновленный токен
        //    await SaveTokenToStorageAsync(savedToken);

        //    return user;
        //}

        // 3. ВЫХОД
        public async Task LogoutAsync(int userId)
        {
            var user = await _context.Users.FindAsync(userId);
            if (user != null)
            {
                ClearUserTokens(user);
                await _context.SaveChangesAsync();
            }

            await ClearTokenFromStorageAsync();
        }

        // 4. СОХРАНЕНИЕ ТОКЕНА В БД
        private async Task SaveRefreshTokenAsync(User user)
        {
            // Генерируем случайный токен
            var token = GenerateSecureToken();

            // Хешируем токен для хранения в БД
            user.RefreshTokenHash = HashToken(token);
            user.TokenExpiresAt = DateTime.UtcNow.AddDays(7); // 7 дней

            // Сохраняем оригинальный токен локально (в зашифрованном виде)
            await SaveTokenToStorageAsync(token);
        }

        // 5. ГЕНЕРАЦИЯ СЛУЧАЙНОГО ТОКЕНА
        private string GenerateSecureToken()
        {
            using var rng = RandomNumberGenerator.Create();
            var tokenData = new byte[32]; // 256 бит
            rng.GetBytes(tokenData);
            return Convert.ToBase64String(tokenData);
        }

        // 6. ХЕШИРОВАНИЕ ТОКЕНА (SHA256)
        private string HashToken(string token)
        {
            using var sha256 = SHA256.Create();
            var hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(token));
            return Convert.ToBase64String(hashBytes);
        }

        // 7. ЛОКАЛЬНОЕ ХРАНЕНИЕ ТОКЕНА (WPF)
        private async Task SaveTokenToStorageAsync(string token)
        {
            // Шифруем токен
            var encrypted = ProtectedData.Protect(
                Encoding.UTF8.GetBytes(token),
                null,
                DataProtectionScope.CurrentUser
            );

            // Сохраняем в настройки приложения
            //Properties.Settings.Default.AuthToken = Convert.ToBase64String(encrypted);
            //Properties.Settings.Default.Save();
        }

        //private async Task<string> LoadTokenFromStorageAsync()
        //{
        //    try
        //    {
        //        var encrypted = Properties.Settings.Default.AuthToken;
        //        if (string.IsNullOrEmpty(encrypted))
        //            return null;

        //        var bytes = Convert.FromBase64String(encrypted);
        //        var decrypted = ProtectedData.Unprotect(
        //            bytes,
        //            null,
        //            DataProtectionScope.CurrentUser
        //        );

        //        return Encoding.UTF8.GetString(decrypted);
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}

        private async Task ClearTokenFromStorageAsync()
        {
            //Properties.Settings.Default.AuthToken = null;
            //Properties.Settings.Default.Save();
        }

        private void ClearUserTokens(User user)
        {
            user.RefreshTokenHash = null;
            user.TokenExpiresAt = null;
        }
    }
}
