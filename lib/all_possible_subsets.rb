# Given a set, generate all possible subsets of it.
# For example if the input set is {1,2,3} then the program should
# return the set containing all possible subsets of it.
# Expected output - {{},{1},{2},{3},{1,2},{1,3},{2,3},{1,2,3}}

def solve(array)
  ## There will be 2**array.size options
  subsets = []

  ##Place all individual elements
  array.each do |element|
    subsets << [element]
  end

  ##Now deal with all other combinations
  0.upto(2**array.size) do
    ## To complete.
  end

  ##Lastly place the original array
  subsets << array
  subsets
end

