# Count pairs with given sum
# Given an array of integers, and a number ‘sum’,
# find the number of pairs of integers in the array whose sum is equal to sum.

# Examples:
# Input  :  arr[] = {1, 5, 7, -1},
#           sum = 6
# Output :  2
# Pairs with sum 6 are (1, 5) and (7, -1)

# Input  :  arr[] = {1, 5, 7, -1, 5},
#           sum = 6
# Output :  3
# Pairs with sum 6 are (1, 5), (7, -1) &
#                      (1, 5)

# Input  :  arr[] = {1, 1, 1, 1},
#           sum = 2
# Output :  6
# There are 3! pairs with sum 2.

# Input  :  arr[] = {10, 12, 10, 15, -1, 7, 6, 5, 4, 2, 1, 1, 1},
#           sum = 11
# Output :  9

def solve(array, sum)
  freq = {}

  array.each do |el|
    freq[el] ?  freq[el] += 1 : freq[el] = 1
  end

  ##TODO
end

## Fails when repeated values are found in the array it seems. At least failing with [1, 1, 1, 1] & sum 2.
def solve_again_with_issues(array, sum)
  result = {}
  freq = {}
  count = 0

  array.each do |el|
    freq[el] ?  freq[el] += 1 : freq[el] = 1
  end

  array.each do |el|
    if freq[sum - el] && !result[sum - el]
      count += freq[sum - el]
    end
  end
  count/2
end

## Now using Ruby STDLIB combination method.
## Fails when repeated values are found in the array it seems. At least failing with [1, 1, 1, 1] & sum 2.
def solve_again_with_more_issues(array, sum)
  array.combination(2).find_all do |one, two|
    one + two == sum
  end.size
end