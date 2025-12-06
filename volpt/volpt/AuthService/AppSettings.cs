using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace volpt.AuthService
{
    public static class AppSettings
    {
        private static readonly string SettingsPath =
            Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
                "SchoolJournal",
                "settings.json"
            );

        // Сохранение токена
        public static void SaveToken(string encryptedToken, string username = null)
        {
            try
            {
                // Создаем директорию если нет
                var dir = Path.GetDirectoryName(SettingsPath);
                if (!Directory.Exists(dir))
                    Directory.CreateDirectory(dir);

                // Читаем существующие настройки или создаем новые
                var settings = LoadSettings();

                settings.AuthToken = encryptedToken;
                if (!string.IsNullOrEmpty(username))
                    settings.LastUsername = username;
                settings.LastSave = DateTime.UtcNow;

                // Сохраняем в JSON
                var json = JsonSerializer.Serialize(settings, new JsonSerializerOptions
                {
                    WriteIndented = true
                });

                File.WriteAllText(SettingsPath, json);
            }
            catch (Exception ex)
            {
                // Можно добавить логгирование
                Console.WriteLine($"Error saving settings: {ex.Message}");
            }
        }
        public static string LoadToken()
        {
            try
            {
                var settings = LoadSettings();
                return settings.AuthToken;
            }
            catch
            {
                return null;
            }
        }

        // Загрузка последнего логина
        public static string LoadLastUsername()
        {
            try
            {
                var settings = LoadSettings();
                return settings.LastUsername;
            }
            catch
            {
                return null;
            }
        }

        // Очистка токена
        public static void ClearToken()
        {
            SaveToken(null);
        }

        // Внутренний метод загрузки настроек
        private static SettingsModel LoadSettings()
        {
            if (!File.Exists(SettingsPath))
                return new SettingsModel();

            try
            {
                var json = File.ReadAllText(SettingsPath);
                return JsonSerializer.Deserialize<SettingsModel>(json) ?? new SettingsModel();
            }
            catch
            {
                return new SettingsModel();
            }
        }
        private class SettingsModel
        {
            public string AuthToken { get; set; }
            public string LastUsername { get; set; }
            public DateTime LastSave { get; set; }
        }
    }
}
