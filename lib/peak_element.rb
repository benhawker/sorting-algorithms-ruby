# Given an array of size n, find a peak element in the array.
# Peak element is the element which is greater than or equal to its neighbors.
# For example - In Array {1,4,3,6,7,5}, 4 and 7 are peak elements.
# We need to return any one peak element.

## element which is greater than or equal to its neighbors.
def solve(array)
  largest_diff = array[1] - array[0]
  result = []

  array.each_with_index do |element, index|
    ##This is pretty horrible.
    if array[index + 1] != nil && array[index - 1] != nil
      if (array[index + 1] < array[index]) && (array[index - 1] < array[index])
        result << array[index]
      end
    end
  end
end
