# Given an array of distinct elements, rearrange the elements of array in zig-zag fashion in O(n) time.
# The converted array should be in form a < b > c < d > e < f.

# Example:
# Input:  arr[] = {4, 3, 7, 8, 6, 2, 1}
# Output: arr[] = {3, 7, 4, 8, 2, 6, 1}

# Input:  arr[] =  {1, 4, 3, 2}
# Output: arr[] =  {1, 4, 2, 3}

# O(nlogn) solution due to sort!
def solve(array)
  array.sort!

  (1..array.size - 2).step(2) do |index|
    array[index], array[index + 1] = array[index + 1], array[index]
  end
end
## Returns [1, 3, 2, 6, 4, 8, 7] +++  1 < 3 > 2 < 6 > 4 < 8 > 7 +++ Unsure whether this is a valid solution?!


# O(n) solution
def solve_more_optimally(array)
  (0..array.size - 2).each do |index|
     ## if index is even we need >
     ## if index is odd we need to see <
     if index % 2 == 0 && array[index] > array[index + 1]
       ##switch them
       array[index], array[index + 1] = array[index + 1], array[index]
     elsif index % 2 != 0 && array[index] < array[index + 1]
       ##switch them
       array[index], array[index + 1] = array[index + 1], array[index]
     end
  end
  array
end
# Returns [3, 7, 4, 8, 2, 6, 1] & [1, 4, 2, 3] as expected :)
