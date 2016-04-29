# Given an array of numbers and a positive integer 'n', find 'n'th most frequent occurring number in that array.
# If there are more than one numbers which are occurring 'n'th most frequently, then you can return any one of such integers.

# Example:  For the input array {1,2,2,2,4,4,4,4,5,5,5,5,5,7,7,8,8,8,8}
# if n = 1, then the output returned should be 5 because it is the most frequent number,
# if n = 2, output can be either 4 or 8 since any of these numbers could be considered as the 2nd most frequent number,
# if n = 3, again output can be either 4 or 8
# if n = 4, output should be 2.

# array = [1,2,2,2,4,4,4,4,5,5,5,5,5,7,7,8,8,8,8]

## Far from perfect solution - but solves the test cases.
def solve(array, integer)
  result = 0
  counts = [0] * (array.max + 1)

  array.each do |element|
    counts[element] += 1
  end

  # Ideally would remove one of these to_h calls. Seems unnecessary.
  counts = counts.map.with_index { |element, index| [index, element] }.to_h
  counts = counts.sort_by { |key, value| value }.reverse.to_h

  result = counts.keys[integer-1]
end

