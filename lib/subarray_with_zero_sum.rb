# Find if there is a subarray with 0 sum
# Given an array of positive and negative numbers, find if there is a subarray (of size at-least one) with 0 sum.

# Examples:

# Input: {4, 2, -3, 1, 6}
# Output: true
# There is a subarray with zero sum from index 1 to 3.

# Input: {4, 2, 0, 1, 6}
# Output: true
# There is a subarray with zero sum from index 2 to 2.

# Input: {-3, 2, 3, 1, 6}
# Output: false
# There is no subarray with zero sum.

#Valid for the 3 above test cases.
def solve(array)
  sub_arrays = Array.new

  ##A Ruby method which goes through per the arg i.e. 123, 234, 345 or 12, 23, 34, 45 etc.
  1.upto(array.size).each do |i|
    tmp = []
    array.each_cons(i) do |element|
      tmp << element
    end
    sub_arrays << tmp
  end
  #Clean up.
  sub_arrays.flatten!(1)

  sub_arrays.each do |arr|
    return true if arr.inject(:+) == 0
  end
  false
end


## TODO - above solution much preferred though.
def solve_again_incorrectly(array)
  array.each_with_index do |el, index|
    return true if el == 0
    sum = 0
    sum += el

    array.each_with_index do |inner_el, inner_index|
      if (index != inner_index)
        sum += inner_el
      end

      puts "Index: #{index}"
      puts "Inner Index: #{inner_index}"
      puts "Sum: #{sum}"
      ## This captures a sum of 0 that is not a subarray. I.e. index 2 and 0 (but exluding 1)
      ## Further logic required to complete this approach.
      return true if (sum == 0)
    end
  end
  false
end
