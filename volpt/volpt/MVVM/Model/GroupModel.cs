using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace volpt.MVVM.Model
{
   public class GroupModel : INotifyPropertyChanged
    {
        private bool _isExpanded;
        private string _name;
        private int _studentCount;
        private int _lessonCount;
        
        public int Id { get; set; }
        
        public string Name
        {
            get => _name;
            set
            {
                if (_name != value)
                {
                    _name = value;
                    OnPropertyChanged();
                }
            }
        }
        
        public List<SubjectModel> Subjects { get; set; } = new();
        
        public int StudentCount
        {
            get => _studentCount;
            set
            {
                if (_studentCount != value)
                {
                    _studentCount = value;
                    OnPropertyChanged();
                }
            }
        }
        
        public int LessonCount
        {
            get => _lessonCount;
            set
            {
                if (_lessonCount != value)
                {
                    _lessonCount = value;
                    OnPropertyChanged();
                }
            }
        }
        
        public bool IsExpanded
        {
            get => _isExpanded;
            set
            {
                if (_isExpanded != value)
                {
                    _isExpanded = value;
                    OnPropertyChanged();
                }
            }
        }
        
        public event PropertyChangedEventHandler PropertyChanged;
        
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

}
