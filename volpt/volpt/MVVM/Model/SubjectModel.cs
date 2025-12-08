using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
    public class SubjectModel : INotifyPropertyChanged
    {
        private string _code;
        private string _title;
        private int _totalHours;

        public int Id { get; set; }

        public string Code
        {
            get => _code;
            set
            {
                if (_code != value)
                {
                    _code = value;
                    OnPropertyChanged();
                    OnPropertyChanged(nameof(IsMdk));
                }
            }
        }

        public string Title
        {
            get => _title;
            set
            {
                if (_title != value)
                {
                    _title = value;
                    OnPropertyChanged();
                }
            }
        }

        public int TotalHours
        {
            get => _totalHours;
            set
            {
                if (_totalHours != value)
                {
                    _totalHours = value;
                    OnPropertyChanged();
                }
            }
        }

        public bool IsMdk => !string.IsNullOrEmpty(Code) && Code.Contains("МДК");

        public string DisplayName => string.IsNullOrEmpty(Code) ? Title : $"{Code} {Title}";

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
