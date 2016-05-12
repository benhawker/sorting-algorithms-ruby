# Given a sorted array of positive integers, rearrange the array alternately
# i.e first element should be maximum value, second minimum value,
# third second max, fourth second min and so on.

# Examples:

# Input  : arr[] = {1, 2, 3, 4, 5, 6, 7}
# Output : arr[] = {7, 1, 6, 2, 5, 3, 4}

# Input  : arr[] = {1, 2, 3, 4, 5, 6}
# Output : arr[] = {6, 1, 5, 2, 4, 3}

# array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def solve(array)
  result = []
  0.upto(array.size/2).each do |i|
    result << array.pop
    result << array.shift
  end
  result.compact
end


def solve_in_place(array)
  array.each_with_index do |element, index|
    temporary = element

    until temporary.nil?
      ## ++++ TODO ++++
    end
   end
end

