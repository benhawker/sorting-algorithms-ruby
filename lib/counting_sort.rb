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