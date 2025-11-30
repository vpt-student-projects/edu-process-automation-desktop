using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls.Primitives;

namespace volpt.Core
{
	public class AdaptiveUniformGrid : UniformGrid
	{
		public double RowSpacing
		{
			get => (double)GetValue(RowSpacingProperty);
			set => SetValue(RowSpacingProperty, value);
		}
		public static readonly DependencyProperty RowSpacingProperty =
			DependencyProperty.Register(nameof(RowSpacing), typeof(double), typeof(AdaptiveUniformGrid),
				new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure | FrameworkPropertyMetadataOptions.AffectsArrange));

		public double ColumnSpacing
		{
			get => (double)GetValue(ColumnSpacingProperty);
			set => SetValue(ColumnSpacingProperty, value);
		}
		public static readonly DependencyProperty ColumnSpacingProperty =
			DependencyProperty.Register(nameof(ColumnSpacing), typeof(double), typeof(AdaptiveUniformGrid),
				new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsMeasure | FrameworkPropertyMetadataOptions.AffectsArrange));

		protected override Size ArrangeOverride(Size finalSize)
		{
			int rows = Rows;
			int cols = Columns;
			int childrenCount = InternalChildren.Count;

			if (childrenCount == 0)
				return finalSize;

			// автоподбор строк и столбцов
			if (rows == 0 && cols == 0)
			{
				cols = (int)Math.Ceiling(Math.Sqrt(childrenCount));
				rows = (int)Math.Ceiling((double)childrenCount / cols);
			}
			else if (rows == 0)
			{
				rows = (int)Math.Ceiling((double)childrenCount / cols);
			}
			else if (cols == 0)
			{
				cols = (int)Math.Ceiling((double)childrenCount / rows);
			}

			// Учитываем spacing в общей ширине и высоте
			double totalColumnSpacing = (cols - 1) * ColumnSpacing;
			double totalRowSpacing = (rows - 1) * RowSpacing;

			double cellWidth = Math.Max((finalSize.Width - totalColumnSpacing) / cols, 300);

			// Рассчитываем высоту на основе максимального количества пар
			double cellHeight = CalculateAdaptiveCardHeight(finalSize.Height, totalRowSpacing, rows);

			int index = 0;
			for (int r = 0; r < rows; r++)
			{
				for (int c = 0; c < cols; c++)
				{
					if (index >= InternalChildren.Count)
						break;

					var child = InternalChildren[index++];
					if (child == null) continue;

					double x = c * (cellWidth + ColumnSpacing);
					double y = r * (cellHeight + RowSpacing);

					child.Arrange(new Rect(x, y, cellWidth, cellHeight));
				}
			}

			return finalSize;
		}

		private double CalculateAdaptiveCardHeight(double totalHeight, double totalRowSpacing, int rows)
		{
			if (rows == 0) return 0;

			// Базовая высота на строку
			double baseHeightPerRow = (totalHeight - totalRowSpacing) / rows;

			// Минимальная высота карточки
			double minCardHeight = 200;

			// Максимальная высота карточки (чтобы не выходила за пределы)
			double maxCardHeight = totalHeight - totalRowSpacing;

			// Возвращаем высоту, но не меньше минимальной
			return Math.Max(baseHeightPerRow, minCardHeight);
		}
	}
}
