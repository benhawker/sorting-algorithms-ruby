# Given an array of n integers where n > 1, nums,
# return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
# Solve it without division and in O(n).

# For example, given [1,2,3,4], return [24,12,8,6].
# Follow up:
# Could you solve it with constant space complexity?
# (Note: The output array does not count as extra space for the purpose of space complexity analysis.)

def solve(array)
  output = Array.new(array.size)

  array.each_index do |i|
    output[i] = sum(array, i)
  end
  output
end

def sum(array, index_to_exclude)
  total = []
  array.each_with_index do |element, index|
    total << element unless index == index_to_exclude
  end
  total.inject(:*)
end