# Given an array of integers, find the longest increasing subsequence.
# Example: X = {3,1,5,2,6,4,9} LIS(X) = {1,2,4,9}

##Definition of LIS seems a little fuzzy. (Longest is size or highest less lowest?)
## Here is a 2nd passing test case array = [10, 22, 9, 33, 21, 50, 41, 60, 80]
## LIS is {10, 22, 33, 50, 60, 80}.

def solve(array)
  all_results = []

  0.upto(array.size - 1).each do |i|
    results = []
    results << array[i]

    array.each_with_index do |element, index|
      if (index > i) && (element > results[-1])
        results << element
      end
    end

    all_results << results
  end

  ## Following code return largest diff between highest and lowest nums
  # slot = []
  # all_results.each do |array|
  #   slot << array[-1] - array[0]
  # end

  # all_results[slot.index(slot.max)]

  ##Following code for longest sequence.
  result = []
  all_results.each do |array|
    if array.size > result.size
      result = array
    elsif array.size == result.size && (array[-1] - array[0]) > (result[-1] - result[0])
      result = array
    end
  end

  result
end

#Returns [1, 5, 6, 9] which also equals the longest increasing subsequence.