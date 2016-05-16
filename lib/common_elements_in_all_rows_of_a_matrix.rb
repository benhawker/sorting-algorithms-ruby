# Common elements in all rows of a given matrix
# Given an m x n matrix, find all common elements present in all rows in O(mn) time and one traversal of matrix.

# Example:

# Input:
# mat[4][5] = {{1, 2, 1, 4, 8},
#              {3, 7, 8, 5, 1},
#              {8, 7, 7, 3, 1},
#              {8, 1, 2, 7, 9},
#             };

# Output:
# 1 8 or 8 1
# 8 and 1 are present in all rows.

# matrix = [
#            [1, 2, 1, 4, 8],
#            [3, 7, 8, 5, 1],
#            [8, 7, 7, 3, 1],
#            [8, 1, 2, 7, 9]
#          ]

##Solves test case
def solve(matrix)
  mapping = {}
  matrix[0].each do |el|
    mapping[el] = 1
  end

  matrix[1..(-1)].each do |row|
    row.each do |el|
      mapping[el] += 1 if mapping[el]
    end
  end

  ## Look to improve - determine result on last iteration of the above each block.
  mapping.each do |k, v|
    puts k if v == matrix.size
  end
end