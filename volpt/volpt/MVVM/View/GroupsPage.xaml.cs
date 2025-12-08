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

        public GroupsPage()
        {
            InitializeComponent();

            // Создаем ViewModel
            _viewModel = new GroupViewModel();
            DataContext = _viewModel;

            // Подписываемся на события изменения свойств
            _viewModel.PropertyChanged += ViewModel_PropertyChanged;

            // Инициализируем UI
            UpdateUI();
        }

        private void ViewModel_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            // Обновляем UI при изменении свойств
            Dispatcher.Invoke(() =>
            {
                if (e.PropertyName == nameof(GroupViewModel.IsLoading) ||
                    e.PropertyName == nameof(GroupViewModel.Groups))
                {
                    UpdateUI();
                }
            });
        }

        private void UpdateUI()
        {
            if (_viewModel == null) return;

            // Обновляем видимость элементов загрузки
            LoadingPanel.Visibility = _viewModel.IsLoading ? Visibility.Visible : Visibility.Collapsed;
            RefreshButton.IsEnabled = !_viewModel.IsLoading;

            if (_viewModel.IsLoading)
            {
                // Показываем индикатор загрузки
                ContentContainer.Content = CreateLoadingContent();
            }
            else if (_viewModel.Groups.Count > 0)
            {
                // Показываем группы
                ContentContainer.Content = CreateGroupsContent();
            }
            else
            {
                // Показываем сообщение "нет данных"
                ContentContainer.Content = CreateNoDataContent();
            }
        }

        private UIElement CreateLoadingContent()
        {
            var stackPanel = new StackPanel
            {
                HorizontalAlignment = HorizontalAlignment.Center,
                VerticalAlignment = VerticalAlignment.Center
            };

            var progressBar = new ProgressBar
            {
                IsIndeterminate = true,
                Width = 200,
                Height = 6,
                Margin = new Thickness(0, 0, 0, 16)
            };

            var textBlock = new TextBlock
            {
                Text = "Загрузка групп...",
                Style = (Style)FindResource("H5"),
                HorizontalAlignment = HorizontalAlignment.Center,
                Foreground = (Brush)FindResource("PrimaryColorBrush")
            };

            stackPanel.Children.Add(progressBar);
            stackPanel.Children.Add(textBlock);

            return stackPanel;
        }

        private UIElement CreateGroupsContent()
        {
            var itemsControl = new ItemsControl
            {
                ItemsSource = _viewModel.Groups
            };

            // Создаем StackPanel для размещения элементов
            var stackPanelFactory = new FrameworkElementFactory(typeof(StackPanel));
            stackPanelFactory.SetValue(StackPanel.OrientationProperty, Orientation.Vertical);

            itemsControl.ItemsPanel = new ItemsPanelTemplate
            {
                VisualTree = stackPanelFactory
            };

            // Создаем DataTemplate для GroupCardView
            var dataTemplate = new DataTemplate();
            var cardFactory = new FrameworkElementFactory(typeof(GroupCardView));
            cardFactory.SetValue(MarginProperty, new Thickness(0, 0, 0, 8));
            dataTemplate.VisualTree = cardFactory;

            itemsControl.ItemTemplate = dataTemplate;

            return itemsControl;
        }

        private UIElement CreateNoDataContent()
        {
            var stackPanel = new StackPanel
            {
                HorizontalAlignment = HorizontalAlignment.Center,
                VerticalAlignment = VerticalAlignment.Center
            };

            var emoji = new TextBlock
            {
                Text = "😔",
                FontSize = 48,
                HorizontalAlignment = HorizontalAlignment.Center,
                Margin = new Thickness(0, 0, 0, 16)
            };

            var title = new TextBlock
            {
                Text = "Группы не найдены",
                Style = (Style)FindResource("H4"),
                HorizontalAlignment = HorizontalAlignment.Center,
                Foreground = (Brush)FindResource("SecondaryBrush"),
                Margin = new Thickness(0, 0, 0, 8)
            };

            var subtitle = new TextBlock
            {
                Text = "Нажмите 'Обновить' чтобы загрузить данные",
                Style = (Style)FindResource("H6"),
                HorizontalAlignment = HorizontalAlignment.Center,
                Foreground = (Brush)FindResource("SecondaryBrush")
            };

            var refreshButton = new Button
            {
                Content = "Обновить",
                HorizontalAlignment = HorizontalAlignment.Center,
                Margin = new Thickness(0, 16, 0, 0),
                MinWidth = 80,
                Background = (Brush)FindResource("PrimaryColorBrush"),
                Foreground = (Brush)FindResource("TextBrush"),
                BorderBrush = Brushes.Transparent,
                BorderThickness = new Thickness(1),
                FontSize = 14,
                Cursor = System.Windows.Input.Cursors.Hand
            };

            refreshButton.Click += (s, e) => _viewModel.LoadGroups();

            // Используем тот же шаблон, что и у главной кнопки
            var template = new ControlTemplate(typeof(Button));
            var borderFactory = new FrameworkElementFactory(typeof(Border));
            borderFactory.SetBinding(Border.BackgroundProperty,
                new System.Windows.Data.Binding("Background") { RelativeSource = new RelativeSource(RelativeSourceMode.TemplatedParent) });
            borderFactory.SetBinding(Border.BorderBrushProperty,
                new System.Windows.Data.Binding("BorderBrush") { RelativeSource = new RelativeSource(RelativeSourceMode.TemplatedParent) });
            borderFactory.SetBinding(Border.BorderThicknessProperty,
                new System.Windows.Data.Binding("BorderThickness") { RelativeSource = new RelativeSource(RelativeSourceMode.TemplatedParent) });
            borderFactory.SetValue(Border.CornerRadiusProperty, new CornerRadius(8));

            var contentFactory = new FrameworkElementFactory(typeof(ContentPresenter));
            contentFactory.SetValue(HorizontalAlignmentProperty, HorizontalAlignment.Center);
            contentFactory.SetValue(VerticalAlignmentProperty, VerticalAlignment.Center);

            borderFactory.AppendChild(contentFactory);
            template.VisualTree = borderFactory;

            // Добавляем триггеры
            var mouseOverTrigger = new Trigger { Property = Button.IsMouseOverProperty, Value = true };
            mouseOverTrigger.Setters.Add(new Setter(Border.BackgroundProperty,
                (Brush)FindResource("PrimaryDarkBrush")));
            template.Triggers.Add(mouseOverTrigger);

            var pressedTrigger = new Trigger { Property = Button.IsPressedProperty, Value = true };
            pressedTrigger.Setters.Add(new Setter(Border.BackgroundProperty,
                (Brush)FindResource("PrimaryDarkBrush")));
            template.Triggers.Add(pressedTrigger);

            refreshButton.Template = template;

            stackPanel.Children.Add(emoji);
            stackPanel.Children.Add(title);
            stackPanel.Children.Add(subtitle);
            stackPanel.Children.Add(refreshButton);

            return stackPanel;
        }

        private void RefreshButton_Click(object sender, RoutedEventArgs e)
        {
            _viewModel?.LoadGroups();
        }
    }
}