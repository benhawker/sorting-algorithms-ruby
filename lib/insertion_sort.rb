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

##+++++++++++++