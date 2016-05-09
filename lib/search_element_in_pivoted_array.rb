# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# How do you find an element in the rotated array efficiently?


# Look at the middle element (7). Compare it with the left most (4) and right most element (2).
# The left most element (4) is less than (7). This gives us valuable information.
# All elements in the bottom half must be in strictly increasing order.
# Therefore, if the key we are looking for is between 4 and 7, we eliminate the upper half; if not, we eliminate the bottom half.
# When left index is greater than right index, we have to stop searching as the key we are finding is not in the array.
# Since we reduce the search space by half each time, the complexity must be in the order of O(lg n).
# It is similar to binary search but is somehow modified for this problem.
# In fact, this is more general than binary search, as it works for both rotated and non-rotated arrays.


def solve(array, value)
  ##Find pivot, split arrays, then binary search both sub arrays.
  split_index = nil

  array.each_with_index do |element, index|
    split_index = (index - 1) if array[index] < array[index - 1]
  end

  left = array.slice(0..split_index)
  right = array.slice((split_index + 1)..(array.size - 1))

  iterative_binary_search(left, value) && iterative_binary_search(right, value)
end

def iterative_binary_search(array, value)
  low = 0
  high = array.size - 1

  while low <= high
    middle = (low + high) / 2
    if array[middle] > value
      high = middle - 1
    elsif array[middle] < value
      low = middle + 1
    else
      return middle
    end
  end
  nil
end

### ++++++++++++++++ ###

def solve_more_optimally(array, value)
  array.size - 1


end