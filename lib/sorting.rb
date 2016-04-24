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


