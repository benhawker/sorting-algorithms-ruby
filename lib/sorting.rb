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

##Bubble sort version 2
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

#+++++++++++++++

##Merge sort
def merge_sort(array)
  ##Just return if array is only 1 element.
  return array if array.size <= 1

  ##Find the mid_point
  mid_point = array.size / 2

  ##Divide
  left = (array.slice(0, mid_point))
  right = (array.slice(mid_point, array.size)) ##the right part may be odd

  #Merge and sort recursively
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  ##Initialize a new array for the results.
  result = []

  ## Until either the left or right section is empty.
  until left.empty? || right.empty?
    ##Shift the smallest of the 2 into the new result array
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end

  ##Return the result array with whatever is left of the left and right arrays.
  result.concat(left).concat(right)
end


#+++++++++++++++

##Merge sort two
def merge_sort_two(array)
  size = array.size
  return array if size < 2

  ##Find the mid_point
  mid_point = size / 2

  ##Divide
  left = (array.slice(0, mid_point))
  right = (array.slice(mid_point, array.size)) ##the right part may be odd

  merge_two(merge_sort_two(left), merge_sort_two(right))
end

def merge_two(left, right)
  result = [] ##initialize empty array for our result.

  ##Set an index for both l and r arrays we have split.
  left_index = 0
  right_index = 0

  while left_index < left.size && right_index < right.size do
  ##Shovel the smallest of the 2 into the new result array.
  ##Retain the old array elements in this example.
    if left[left_index] <= right[right_index]
      result << left[left_index]
      left_index += 1
    else
      result << right[right_index]
      right_index += 1
    end
  end

  ##We are still going to have one array with something in it though.
  if (left_index < left.size)
    for i in (left_index..(left.size - 1)) do
      result << left[i]
    end
  else
    for i in (right_index..(right.size - 1)) do
      result << right[i]
    end
  end

  result
end

##++++++++++++

##Not useful for huge numbers - memory allocation issues.
def counting_sort(array)
  ##intialize an empty array for the sorted result
  result = []

  ##Intialize an array to hold the count of each number we see
  counts = [0] * (array.max - (array.min - 1))

  array.each do |element|
    counts[element - array.min] += 1
  end


  counter = 0

  while counter < counts.size do
    counts[counter].times do
      result << counter + array.min
    end
    counter += 1
  end

  result
end


##+++++++++++++

##Solution one.
def insertion_sort(array)
  #Iterate through the array with an index
  array.each_with_index do |array_element, index|

    #Sets a counter equal the current index - 1
    counter = index - 1

    while counter >= 0
      break if array[counter] <= array_element
      array[counter + 1] = array[counter]
      counter -= 1
    end
    array[counter + 1] = array_element
  end
end


##Solution two
def insertion_sort_two(array)
  #Initialize empty array for the results.
  result = []
  #Take the first value from the existing array and << into result
  result << array.shift

  for element in array
    index = 0
    while index < result.size
      if element <= result[index]
        result.insert(index, element)
        break
      elsif index == (result.size - 1)
        result.insert(index + 1, element)
        break
      end
      index += 1
    end
  end
  result.shift
  result
end


def insertion_sort_three(array)



end
