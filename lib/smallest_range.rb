# You have k lists of sorted integers.
# Find the smallest range that includes at least one number from each of the k lists.
# For example:
# List 1: [4, 10, 15, 24, 26]
# List 2: [0, 9, 12, 20]
# List 3: [5, 18, 22, 30]
# The smallest range here would be [20, 24] as it contains 24 from list 1, 20 from list 2, and 22 from list 3.
# Start by constructing a heap out of the first 3 elements (keep track of the min and max yourself).
# Assume no duplicates, otherwise counts
# Pop and insert from the heap based on which list it came from.
# Entirely process the list, then clear out the heap.
# That should run in O(nlg(k)) time. Space should be O(k).


## I presume input of mutliple lists like so [[4, 10, 15, 24, 26], [0, 9, 12, 20], [5, 18, 22, 30]]
def smallest_range(lists)
  number_of_lists = lists.size

  ## We don't want to just hardcode a large value. Let's take [0][0], [1][0], [2][0] etc.
  smallest_range_arr = []
  smallest_range_values = []

  ## Let's go through the array of positions and pull out the values
  0.upto(lists.size - 1) do |int|
    smallest_range_values << lists[int][0]
  end

  ## Calculate a smallest range for starting with,
  smallest_range_values.sort!
  starting_smallest_range = smallest_range_values[-1] - smallest_range_values[0]

  ## +++++++++ ## Now we'll look for the smallest range and replace if smaller than the starting point.
  min_range_calculator(lists)
end

def min_range_calculator(lists)
  lists.each do |list|
    ##To complete lists[0..index].min
  end
end