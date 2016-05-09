# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# How do you find an element in the rotated array efficiently?

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