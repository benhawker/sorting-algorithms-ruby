# Find the element that occurs only once in a given set of integers
# while all the other numbers occur thrice.
# Example 1:
# Input : 3 3 3 4
# Output: 4

# Example 2:
# Input : 5 5 4 8 4 5 8 9 4 8
# Output: 9

# array = %w(5 5 4 8 4 5 8 9 4 8).map(&:to_i)

def solve(array)
  results = [0] * (array.max + 1)

  array.each do |element|
    results[element] + 1
  end
  array.index(1)
end