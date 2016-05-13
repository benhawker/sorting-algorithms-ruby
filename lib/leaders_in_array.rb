# Leaders in an array
# Write a program to print all the LEADERS in the array.
# An element is leader if it is greater than all the elements to its right side.
# And the rightmost element is always a leader. For example int the array {16, 17, 4, 3, 5, 2}, leaders are 17, 5 and 2.
# Let the input array be arr[] and size of the array be size.

array = [16, 17, 4, 3, 5, 2]

def solve(array)
  leaders = []
  array.each_with_index do |element, index|
    leaders << element if element > (array[index + 1..array.size - 1]).inject(:+)
  end
  leaders << array.pop
end