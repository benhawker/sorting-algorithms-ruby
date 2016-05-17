# Return the largest sum of contiguous integers in the array.
# Example: if the input is (-10, 2, 3, -2, 0, 5, -15),
# the largest sum is 8.

def solve(array)
  largest_sum = 0

  array.each_with_index do |element, index|
    current_largest_sum = 0
    if element > 0
      current_largest_sum += element

      array[index..(-1)].each do |el|
        current_largest_sum += el if el > element
      end
      current_largest_sum -= element
      largest_sum = current_largest_sum if current_largest_sum > largest_sum
    end
  end
  largest_sum
end
