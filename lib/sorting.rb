## array = [1,8,5,2,5,6]

##Bubble sort
def bubble_sort(array)
  length = array.size

  loop do
    swapped = false

    0.upto(length - 2) do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if swapped == false
  end
  array
end

##
def bubble_sort_two(array)
  number_of_iterations = array.size - 2
  swaps_made = true

  while swaps_made == true do
    swaps_made = false

    0.upto(number_of_iterations) do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swaps_made = true
      end
    end
  end

  array
end

