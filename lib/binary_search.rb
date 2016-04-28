##+++++++++++++++++++
# array = (0..20).map(&:to_i)
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

# array = (0..20).step(2).map(&:to_i)
# => [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# array = (0..50).step(4).map(&:to_i)
# => [0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48]
##+++++++++++++++++++

## Iterative approach.
## Presumes input is a sorted array.
## Outputs the position of the target in the given array.
## Blows up if target is 0 or is not included in the given array otherwise seems ok. Needs spec to validate.
def binary_search(array, target, offset=0)
  result = 0
  offset = 0

  while result == 0
    low  = 0
    high = array.size - 1
    mid  = (low + high) / 2

    if target < array[mid]
      # Slice out the right part of the array.
      # No need for offset and old array[0] is the same new array[0]
      array = array.slice(low..mid)
      #binary_search(array, target, offset)
    elsif target > array[mid]
      # Slice out the left part of the array it is not in. Problem to then get index of target.
      # So keep a count of how many elements were removed.
      offset += (high - mid) - 1 ## Always returns a positive int.
      array = array.slice(mid..high)
      #binary_search(array, target, offset)
    else # It must be the mid & we have found the solution
      result = mid
    end
  end
  # Return the result + the offset
  result + offset
end

##+++++++++++++++++++