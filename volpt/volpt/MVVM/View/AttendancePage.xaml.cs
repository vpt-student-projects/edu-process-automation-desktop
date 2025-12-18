using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using volpt.MVVM.ViewModel;

namespace volpt.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для AttendancePage.xaml
    /// </summary>
    public partial class AttendancePage : Page
    {

        public AttendancePage(int groupId, int subjectId)
        {
            InitializeComponent();
            DataContext = new AttendancePageViewModel(groupId, subjectId);
        }

        private void AttendanceView_Loaded(object sender, RoutedEventArgs e)
        {

        }
    }
}
