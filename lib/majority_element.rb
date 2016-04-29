# Given an array of size n, find the element which occurs more than n/2 times.
# This element is called Majority Element.

# array = [1,2,2]
# array = [6,6,6,6,6,6,6,6,6,2,2,2,2,2,3,3,3,6,6,6,6,6,6,6]

## Solves the above test cases.
def solve(array)
  result = 0
  counts = [0] * array.size

  array.each do |element|
    counts[element] += 1
  end

  counts.each do |element|
    if element > (array.size / 2)
      result = counts.index(element)
      break
    end
  end
  result
end