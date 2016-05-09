# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.
# For example,

# Consider the following matrix:
# [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# Given target = 3, return true.

def solve(array, value, left=0, right=nil)
  array.flatten!

  right = (array.size - 1) if right.nil?
  ## Need to return false in case the value is not included in the array.
  return false if left > right

  mid_point = (right + left / 2)
  mid_value = array[mid_point]

  if value < mid_value
    solve(array, value, left, mid_point -1)
  elsif value > mid_value
    solve(array, value, mid_point + 1, right)
  else
    ## We found the value
    return true
  end
end
