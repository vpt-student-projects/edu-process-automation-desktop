using System;
using System.Collections.Generic;
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
				new FrameworkPropertyMetadata(12.0, FrameworkPropertyMetadataOptions.AffectsMeasure | FrameworkPropertyMetadataOptions.AffectsArrange));

		public double ColumnSpacing
		{
			get => (double)GetValue(ColumnSpacingProperty);
			set => SetValue(ColumnSpacingProperty, value);
		}
		public static readonly DependencyProperty ColumnSpacingProperty =
			DependencyProperty.Register(nameof(ColumnSpacing), typeof(double), typeof(AdaptiveUniformGrid),
				new FrameworkPropertyMetadata(12.0, FrameworkPropertyMetadataOptions.AffectsMeasure | FrameworkPropertyMetadataOptions.AffectsArrange));

		// Минимальная ширина карточки
		public double MinCardWidth
		{
			get => (double)GetValue(MinCardWidthProperty);
			set => SetValue(MinCardWidthProperty, value);
		}
		public static readonly DependencyProperty MinCardWidthProperty =
			DependencyProperty.Register(nameof(MinCardWidth), typeof(double), typeof(AdaptiveUniformGrid),
				new FrameworkPropertyMetadata(280.0, FrameworkPropertyMetadataOptions.AffectsMeasure | FrameworkPropertyMetadataOptions.AffectsArrange));

		// Использовать ли единую высоту для всех карточек
		public bool UniformRowHeight
		{
			get => (bool)GetValue(UniformRowHeightProperty);
			set => SetValue(UniformRowHeightProperty, value);
		}
		public static readonly DependencyProperty UniformRowHeightProperty =
			DependencyProperty.Register(nameof(UniformRowHeight), typeof(bool), typeof(AdaptiveUniformGrid),
				new FrameworkPropertyMetadata(false, FrameworkPropertyMetadataOptions.AffectsMeasure | FrameworkPropertyMetadataOptions.AffectsArrange));

		private List<double> _rowHeights = new List<double>();

		protected override Size MeasureOverride(Size constraint)
		{
			int childrenCount = InternalChildren.Count;
			if (childrenCount == 0)
				return new Size(0, 0);

			int rows = Rows;
			int cols = Columns;

			// Автоподбор колонок
			if (rows == 0 && cols == 0)
			{
				cols = CalculateOptimalColumns(constraint.Width);
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

			// Рассчитываем ширину ячейки
			double totalColumnSpacing = Math.Max(0, cols - 1) * ColumnSpacing;
			double availableWidth = Math.Max(0, constraint.Width - totalColumnSpacing);
			double cellWidth = Math.Max(MinCardWidth, availableWidth / cols);

			// Очищаем список высот
			_rowHeights.Clear();

			double totalHeight = 0;
			int currentRow = 0;

			// Измеряем каждую карточку и собираем высоты по строкам
			for (int i = 0; i < childrenCount; i++)
			{
				var child = InternalChildren[i];
				if (child != null)
				{
					// Измеряем карточку с текущей шириной
					child.Measure(new Size(cellWidth, double.PositiveInfinity));
					double childHeight = child.DesiredSize.Height;

					// Определяем строку для этой карточки
					int row = i / cols;

					// Если это новая строка, добавляем ее высоту
					if (row >= _rowHeights.Count)
					{
						_rowHeights.Add(childHeight);
					}
					else
					{
						// Ищем максимальную высоту в строке
						_rowHeights[row] = Math.Max(_rowHeights[row], childHeight);
					}
				}
			}

			// Суммируем высоты всех строк с учетом отступов
			for (int r = 0; r < _rowHeights.Count; r++)
			{
				totalHeight += _rowHeights[r];
				if (r > 0) totalHeight += RowSpacing;
			}

			return new Size(
				Math.Min(cols * cellWidth + totalColumnSpacing, constraint.Width),
				Math.Min(totalHeight, constraint.Height)
			);
		}

		protected override Size ArrangeOverride(Size finalSize)
		{
			int childrenCount = InternalChildren.Count;
			if (childrenCount == 0)
				return finalSize;

			int rows = Rows;
			int cols = Columns;

			// Автоподбор колонок
			if (rows == 0 && cols == 0)
			{
				cols = CalculateOptimalColumns(finalSize.Width);
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

			// Рассчитываем ширину ячейки
			double totalColumnSpacing = Math.Max(0, cols - 1) * ColumnSpacing;
			double availableWidth = Math.Max(0, finalSize.Width - totalColumnSpacing);
			double cellWidth = Math.Max(MinCardWidth, availableWidth / cols);

			// Располагаем элементы
			int index = 0;
			double currentY = 0;

			for (int row = 0; row < rows; row++)
			{
				double rowHeight = 0;
				if (UniformRowHeight)
				{
					// Находим максимальную высоту в строке
					for (int i = row * cols; i < Math.Min((row + 1) * cols, childrenCount); i++)
					{
						if (i < InternalChildren.Count && InternalChildren[i] != null)
						{
							rowHeight = Math.Max(rowHeight, InternalChildren[i].DesiredSize.Height);
						}
					}
				}
				else if (row < _rowHeights.Count)
				{
					rowHeight = _rowHeights[row];
				}

				double currentX = 0;

				for (int col = 0; col < cols; col++)
				{
					if (index >= childrenCount)
						break;

					var child = InternalChildren[index++];
					if (child == null)
						continue;

					// Высота карточки
					double childHeight = UniformRowHeight ? rowHeight : child.DesiredSize.Height;

					// Располагаем карточку
					child.Arrange(new Rect(currentX, currentY, cellWidth, childHeight));

					currentX += cellWidth + ColumnSpacing;
				}

				currentY += rowHeight + (row < rows - 1 ? RowSpacing : 0);
			}

			return finalSize;
		}

		private int CalculateOptimalColumns(double availableWidth)
		{
			// Рассчитываем максимальное количество колонок
			double requiredWidth = MinCardWidth + ColumnSpacing;
			int maxColumns = Math.Max(1, (int)Math.Floor((availableWidth + ColumnSpacing) / requiredWidth));

			// Ограничиваем разумным максимумом
			return Math.Min(maxColumns, 3);
		}
	}
}