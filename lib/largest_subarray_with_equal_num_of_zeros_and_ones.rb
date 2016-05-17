# Largest subarray with equal number of 0s and 1s
# Given an array containing only 0s and 1s, find the largest subarray which contain equal no of 0s and 1s.
# Expected time complexity is O(n).

# Examples:

# Input: arr[] = {1, 0, 1, 1, 1, 0, 0}
# Output: 1 to 6 (Starting and Ending indexes of output subarray)

# Input: arr[] = {1, 1, 1, 1}
# Output: No such subarray

# Input: arr[] = {0, 0, 1, 1, 0}
# Output: 0 to 3 Or 1 to 4

def solve(array)
  sub_arrays = Array.new

  1.upto(array.size).each do |i|
    tmp = []
    #A Ruby method which goes through per the arg i.e. 123, 234, 345 or 12, 23, 34, 45 etc.
    array.each_cons(i) do |element|
      tmp << element
    end
    sub_arrays << tmp
  end
  #Clean up.
  sub_arrays.flatten!(1)
  ## This has the bad effect of destroying the indexes which we need to output

  # Reverse it so we deal with the largest first - can then just break/return at first valid one found.
  sub_arrays.reverse.each do |arr|
    count_zero = 0
    count_ones = 0
    arr.each_with_index do |el, index|
    #   zero_one_map = { 0 => 0, 1 => 0 }
    #   zero_one_map[el] ? zero_one_map[el] += 1 : nil
    count_zero += 1 if el == 0
    count_zero += 1 if el == 1

    if (index == arr.size - 1)
      puts count_zero
      puts count_ones
    end
    #puts arr if ((count_zero == count_ones) && (index == arr.size - 1))
    ##horribly wrong
    end
  end

end