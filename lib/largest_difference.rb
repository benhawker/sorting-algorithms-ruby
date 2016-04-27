## For the given array [1,4,3,6,7,5] return the elements that have the peak difference
## vs the previous element

# array = [1,4,3,6,7,5]

def solve(array)
  largest_diff = array[1] - array[0]
  result = []

  array.each_with_index do |element, index|
    if array[index + 1] != nil
      if (array[index + 1] - array[index]) >= largest_diff
        result << array[index + 1]
      end
    end
  end
end

##Returns 4, 6 (for the largest_diff = 3)