# Check if it's a valid solution.
# Each row must contain all digits from 1-9
# Each column must contain all digits from 1-9
# Each 3 x 3 sq must contain all digits from 1-9

class SudokuValidator
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def solution_valid?
    all_rows_valid? && all_columns_valid? && all_squares_valid?
  end

  private

  def all_squares_valid?
    square_references.each do |refs|
      return false unless square_valid?(refs)
    end
    true
  end

  ## Pass all the refs for a given square like so...
  ## [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]
  def square_valid?(refs)
    square = []

    refs.each do |ref|
      square << grid[ref[0]][ref[1]]
    end

    square.size == square.uniq.size ? true : false
  end

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

  def square_references
    square_references = []
    (0...8).step(3).each do |col|
      (0...8).step(3).each do |row|
        ##Hardcoded as we are fixed at 9x9.
        square_references << [[col, row],   [col, row+1],   [col, row+2],
                              [col+1, row], [col+1, row+1], [col+1, row+2],
                              [col+2, row], [col+2, row+1], [col+2, row+2]
                             ]
      end
    end
    square_references
  end

end

## +++++++

# def build_grid
#   Array.new(9) { Array.new(9) { nil } }
# end

## Invalid grid
# [[1, 2, 3, 4, 5, 6, 7, 8, 9],
#  [2, 3, 4, 5, 6, 7, 8, 9, 1],
#  [3, 4, 5, 6, 7, 8, 9, 1, 2],
#  [4, 5, 6, 7, 8, 9, 1, 2, 3],
#  [5, 6, 7, 8, 9, 1, 2, 3, 4],
#  [6, 7, 8, 9, 1, 2, 3, 4, 5],
#  [7, 8, 9, 1, 2, 3, 4, 5, 6],
#  [8, 9, 1, 2, 3, 4, 5, 6, 7],
#  [9, 1, 2, 3, 4, 5, 6, 7, 8]]