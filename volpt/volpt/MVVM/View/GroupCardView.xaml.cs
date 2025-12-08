using System.Windows;
using System.Windows.Controls;
using volpt.MVVM.Model;

namespace volpt.MVVM.View
{
    public partial class GroupCardView : UserControl
    {
        public GroupCardView()
        {
            InitializeComponent();
        }

        private void ExpandButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataContext is GroupModel group)
            {
                group.IsExpanded = !group.IsExpanded;
            }
        }

        private void ScheduleButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataContext is GroupModel group)
            {
                MessageBox.Show($"Открыть расписание группы: {group.Name} (ID: {group.Id})",
                    "Расписание", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void StudentsButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataContext is GroupModel group)
            {
                MessageBox.Show($"Открыть студентов группы: {group.Name} (ID: {group.Id})",
                    "Студенты", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}