# Find lost element from a duplicated array
# Given two arrays which are duplicates of each other except one element,
# that is one element from one of the array is missing, we need to find that missing element.
# Examples:
# Input:  arr1[] = {1, 4, 5, 7, 9}
#         arr2[] = {4, 5, 7, 9}
# 1 is missing from second array.

# Input: arr1[] = {2, 3, 4, 5}
#        arr2[] = {2, 3, 4, 5, 6}
# 6 is missing from first array.
##+++++++++++++++++++

## Sample test cases:
array_one = [4, 5, 7, 9]
array_two = [4, 5, 3, 7, 9]
# Output: 3

array_one = [4, 5, 7, 9]
array_two = [4, 5, 7, 3, 9]
# Output: 3

array_one = [4, 5, 7]
array_two = [4, 5, 7, 9]
# Output: 9

array_one = [4, 5, 7, 9]
array_two = [4, 5, 7]
# Output: 9

array_one = [2, 3, 4, 5]
array_two = [2, 3, 4, 5, 6]
# Output: 6

##+++++++++++++++++++

## Solves the above test cases.
def solution_one(array_one, array_two)
  combined = (array_one << array_two).flatten
  combined = combined.sort
  result = 0

  if combined[-1] != combined[-2]
    result = combined[-1]
  elsif combined[0] != combined[1]
    result = combined[0]
  else
    combined.each_with_index do |element, index|
      if ((combined[index] != combined[index - 1]) || (combined[index] != combined[index + 1]))
        result = element
      end
    end
  end
  result
end

##+++++++++++++++++++

## Solves the above test cases.
## Need to know which array is larger due to the behaviour of Ruby's Array#zip.
## Memory hog - a sub optimal solution.
def solution_two(array_one, array_two)
  if array_one.size < array_two.size
    larger_array = array_two
    smaller_array = array_one
  else
    larger array = array_one
    smaller_array = array_two
  end

  ##Zip is probably no optimal here, but it's a different approach to solution #1.
  combined = larger_array.zip(smaller_array).flatten
  ##Clears up the behaviour of zip.
  combined.pop if combined[-1] == nil

  counters = [0] * (combined.max + 1)

  combined.each_with_index do |element, index|
    counters[element] += 1
  end

  counters.index(1)
end


##+++++++++++++++++++

# Start binary search in bigger array and get mid as (lo + hi) / 2
# If value from both array is same then missing element must be in right part so set lo as mid
# Else set hi as mid because missing element must be in left part of bigger array if mid elements are not equal.
# Special case are handled separately as for single element and zero element array, single element itself will be the missing element.
# If first element itself is not equal then that element will be the missing element./li>

##Binary search iterative approach
def binary_solve(array_one, array_two)
  ## Binary search requires that both arrays are sorted.
  array_one.sort
  array_two.sort

  if array_one.size < array_two.size
    larger_array = array_two
    smaller_array = array_one
  else
    larger array = array_one
    smaller_array = array_two
  end

  low  = 0
  high =  array.size - 1

  while(high >= low) do
    mid = (low + high) / 2
    if larger_array[mid] >
      ##To be completed.
    end
  end

end
