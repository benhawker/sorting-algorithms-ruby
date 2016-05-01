# Given an integer array and a number k, print the maximum sum subarray of size k.
# Maximum average subarray of size k is a subarray (sequence of contiguous elements in the array)
# for which the average is maximum among all subarrays of size k in the array.
# Average of k elements = (sum of k elements)/k
# Since k > 0, the maximum sum subarray of size k will also be maximum average subarray of size k.
# So, the problem reduces to finding maximum sum subarray of size k in the array.

# Consider [11, -8, 16, -7, 24, -2, 3]

#Subarrays of size k = 3
# [11, -8, 16] has a sum of 19
# [-8, 16, -7] has a sum of 1
# [16, -7, 24] has a sum of 33 (max)
# [-7, 24, -2] has a sum of 15
# [24, -2, 3]  has a sum of 25

  ##What is the number of subarrays needed?
  # [1,2,3,4]
  # [1,2] [2,3] [3,4]

  # [1,2,3,4,5,6]
  # [1,2] [2,3] [3,4] [4,5] [5,6]

  # [1,2,3,4,5,6,7]
  # [1,2] [2,3] [3,4] [4,5] [5,6] [6,7]

  # [1,2,3,4,5,6]
  # [1,2,3] [2,3,4] [3,4,5] [4,5,6]

  # [1,2,3,4,5,6,7]
  # [1,2,3] [2,3,4] [3,4,5] [4,5,6] [5,6,7]

  # [1,2,3,4,5,6,7]
  # [1,2,3,4] [2,3,4,5] [3,4,5,6] [4,5,6,7]

## Solves the given test case.
def max_average_sub_array(array, size)
  ##Create some empty subarrays of the size
  ## Each sub array size is size(k)
  sub_arrays = Array.new(array.size) { Array.new }
  count_one = 0
  count_two = 0

  ##A Ruby method which goes through per the arg i.e. 123, 234, 345 etc.
  array.each_cons(size) do |element|
    sub_arrays[count_one][count_two] = element
    count_one += 1
  end
  #Clean up the nils and additional arrays created.
  sub_arrays.flatten!(1)
  ##Returns - [[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6]]

  ## Lets go through each subarray and save the max.
  max_current = 0

  sub_arrays.each do |arr|
    arr_sum = arr.inject(:+)
    if arr_sum > max_current
      max_current = arr_sum
    end
  end

  max_current
end


### +++ TODO: Rewrite without using each_cons +++ ###

