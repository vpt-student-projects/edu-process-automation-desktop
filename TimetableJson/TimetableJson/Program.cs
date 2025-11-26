using System.Net.Http;
using System.Text.Json;
using static System.Net.WebRequestMethods;
using System.Text.RegularExpressions;

namespace TimetableJson
{
    internal class Program
    {

        static async Task Main(string[] args)
        {
            string teacherName = "Дмитриев Алексей Андреевич";
            var timetableService = new TimetableApiService();
            var schedule = await timetableService.GetTeacherScheduleAsync(teacherName);

            Console.WriteLine($"\nНайдено пар: {schedule.Count}");
            foreach (var lesson in schedule)
            {
                Console.WriteLine($"{lesson.Date:dd.MM.yyyy} - {lesson.LessonNumber} пара: {lesson.Subject}");
                Console.WriteLine($"Группа: {lesson.Group}, Аудитория: {lesson.Classroom}");
                Console.WriteLine();
            }
        }
    }

    public class TimetableApiService
    {
        private readonly HttpClient _httpClient = new HttpClient();

        public async Task<List<TeacherSchedule>> GetTeacherScheduleAsync(string teacherName)
        {
            var apiResponse = await GetTimetableFromApiAsync();
            if (apiResponse?.Timetable == null) return new List<TeacherSchedule>();

            var result = new List<TeacherSchedule>();

            foreach (var corpusEntry in apiResponse.Timetable)
            {
                if (corpusEntry.Value == null) continue;

                // Обходим все дни в корпусе
                foreach (var dayEntry in corpusEntry.Value)
                {
                    if (dayEntry.Value == null) continue;

                    // Парсим дату из названия дня
                    if (TryParseDateFromDayKey(dayEntry.Key, out DateTime date))
                    {
                        // Обходим все группы в этот день
                        foreach (var groupEntry in dayEntry.Value)
                        {
                            if (groupEntry.Value?.Lessons == null) continue;

                            // Обходим все пары в группе
                            foreach (var apiLesson in groupEntry.Value.Lessons)
                            {
                                if (apiLesson?.Teacher == teacherName)
                                {
                                    result.Add(new TeacherSchedule
                                    {
                                        Date = date,
                                        LessonNumber = int.TryParse(apiLesson.Number, out int num) ? num : 0,
                                        Subject = apiLesson.Title ?? "",
                                        Group = groupEntry.Value.Name ?? "",
                                        Classroom = apiLesson.Aud ?? ""
                                    });
                                }
                            }
                        }
                    }
                }
            }

            return result;
        }

        private bool TryParseDateFromDayKey(string dayKey, out DateTime date)
        {
            date = DateTime.MinValue;

            try
            {
                // Ищем дату в формате "dd.MM.yy" в строке типа "Понедельник 22.09.25"
                var match = System.Text.RegularExpressions.Regex.Match(dayKey, @"\d{2}\.\d{2}\.\d{2}");
                if (match.Success)
                {
                    return DateTime.TryParseExact(match.Value, "dd.MM.yy", null,
                        System.Globalization.DateTimeStyles.None, out date);
                }
            }
            catch
            {
                // Игнорируем ошибки
            }

            return false;
        }

        public async Task<ApiTimetableResponse> GetTimetableFromApiAsync()
        {
            try
            {
                string json = await _httpClient.GetStringAsync("https://timetable.volptbot.ru/timetable.json");
                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
                var response = JsonSerializer.Deserialize<ApiTimetableResponse>(json, options);
                return response;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка: {ex.Message}");
                return null;
            }
        }
    }


}

