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