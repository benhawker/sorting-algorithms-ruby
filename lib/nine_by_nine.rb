# Check if it's a valid solution.
# Grid size is 9x9
# Each row must contain all digits from 1-9
# Each column must contain all digits from 1-9
## Essentially Sudoku without the 3x3 rule. Aka Bad Sudoku!

class NineByNineValidator
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def solution_valid?
    all_rows_valid? && all_columns_valid?
  end

  private

  def all_columns_valid?
    column = []

    0.upto(8) do |col|
      grid.each do |row|
        column << row[col]
        return false unless column_valid?(column)
        column = [] if column.size == 8
      end
    end
    true
  end

  def column_valid?(column)
    column.size == column.uniq.size ? true : false
  end

  def all_rows_valid?
    grid.each do |row|
      return false unless row_valid?(row)
    end
    true
  end

  def row_valid?(row)
    row.size == row.uniq.size ? true : false
  end
end

## +++++++

def build_grid
  Array.new(9) { Array.new(9) { nil } }
end

## Valid grid
# [[1, 2, 3, 4, 5, 6, 7, 8, 9],
#  [2, 3, 4, 5, 6, 7, 8, 9, 1],
#  [3, 4, 5, 6, 7, 8, 9, 1, 2],
#  [4, 5, 6, 7, 8, 9, 1, 2, 3],
#  [5, 6, 7, 8, 9, 1, 2, 3, 4],
#  [6, 7, 8, 9, 1, 2, 3, 4, 5],
#  [7, 8, 9, 1, 2, 3, 4, 5, 6],
#  [8, 9, 1, 2, 3, 4, 5, 6, 7],
#  [9, 1, 2, 3, 4, 5, 6, 7, 8]]