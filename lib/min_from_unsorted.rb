# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# Find the minimum element.
# You may assume no duplicate exists in the array.


## No need to sort - we can tell where the array was pivoted so only need to reach the pivot? ##Assumes only 1 pivot.
def solve(array)
  ##Set minimum to be the last element.
  minimum = array[-1]

  ## Iterate until we reach the change.
  array.each_with_index do |element, index|
    if array[index] < array[index - 1]
      minimum = array[index]
      break
    end
  end
end

##### +++++++ ######

## Don't sort and just iterate through until you find it.
def solve_again(array)
  minimum = array[0]

  array.each do |element|
    element = minimum if element < minimum
  end
  minimum
end