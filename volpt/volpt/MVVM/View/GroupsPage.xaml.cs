using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Media;
using volpt.MVVM.ViewModel;

namespace volpt.MVVM.View
{
    public partial class GroupsPage : Page
    {
        private GroupViewModel _viewModel;
        private readonly int _userId;

        public GroupsPage() : this(0)
        {
        }

        public GroupsPage(int userId)
        {
            InitializeComponent();
            _userId = userId;

            // Создаем ViewModel с учетом текущего пользователя
            _viewModel = new GroupViewModel(_userId);
            DataContext = _viewModel;
        }
    }
}