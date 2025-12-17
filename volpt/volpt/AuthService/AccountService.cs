using System.Security.Cryptography;
using System.Text;
using System.Windows;
using Microsoft.EntityFrameworkCore;

namespace volpt.AuthService
{
    public class AccountService
    {
        private readonly VolpteducationDbContext _context;

        public AccountService(VolpteducationDbContext context)
        {
            _context = context;
        }

        // 1. ВХОД С ПАРОЛЕМ
        public async Task<User> LoginAsync(string login, string password)
        {
            // Находим пользователя
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.Login == login);

            if (user == null)
                return null;

            if (!BCrypt.Net.BCrypt.Verify(password, user.PasswordHash))
                return null;

            // Генерируем и сохраняем токен
            SaveRefreshToken(user);
            await _context.SaveChangesAsync();
            return user;
        }

        public async Task<User> AutoLoginAsync()
        {

            var savedToken = LoadTokenFromStorage();
            if (string.IsNullOrEmpty(savedToken))
                return null;

            // Находим пользователя по токену
            var tokenHash = HashToken(savedToken);
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.RefreshTokenHash == tokenHash);

            if (user == null || !user.IsTokenValid)
            {
                ClearTokenFromStorage();
                return null;
            }

            // Обновляем время истечения токена (продлеваем сессию)
            user.TokenExpiresAt = DateTime.UtcNow.AddDays(90);
            await _context.SaveChangesAsync();

            // Сохраняем обновленный токен
            SaveTokenToStorage(savedToken);

            return user;
        }

        // 3. ВЫХОД
        public async Task LogoutAsync(int userId)
        {
            var user = await _context.Users.FindAsync(userId);
            if (user != null)
            {
                ClearUserTokens(user);
                await _context.SaveChangesAsync();
            }
            ClearTokenFromStorage();
        }

        // 4. СОХРАНЕНИЕ ТОКЕНА В БД
        private void SaveRefreshToken(User user)
        {
            // Генерируем случайный токен
            var token = GenerateSecureToken();

            // Хешируем токен для хранения в БД
            user.RefreshTokenHash = HashToken(token);
            user.TokenExpiresAt = DateTime.UtcNow.AddDays(90);

            // Сохраняем оригинальный токен локально (в зашифрованном виде)
            SaveTokenToStorage(token);
        }

        // 5. ГЕНЕРАЦИЯ СЛУЧАЙНОГО ТОКЕНА
        private string GenerateSecureToken()
        {
            using var rng = RandomNumberGenerator.Create();
            var tokenData = new byte[32];
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
        private void SaveTokenToStorage(string token)
        {
            // Шифруем токен
            var encrypted = ProtectedData.Protect(
                Encoding.UTF8.GetBytes(token),
                null,
                DataProtectionScope.CurrentUser
            );

            // Сохраняем в настройки приложения
            AppSettings.SaveToken(Convert.ToBase64String(encrypted));
        }

        private string LoadTokenFromStorage()
        {
            try
            {
                var encrypted = AppSettings.LoadToken();

                var bytes = Convert.FromBase64String(encrypted);
                var decrypted = ProtectedData.Unprotect(
                    bytes,
                    null,
                    DataProtectionScope.CurrentUser
                );

                return Encoding.UTF8.GetString(decrypted);
            }
            catch
            {
                return null;
            }
        }

        private void ClearTokenFromStorage()
        {
            AppSettings.ClearToken();
        }

        private void ClearUserTokens(User user)
        {
            user.RefreshTokenHash = null;
            user.TokenExpiresAt = null;
        }
    }
}
