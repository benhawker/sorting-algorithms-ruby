# Given an array of integers print the missing elements that lie in range 0-99.
# If there are more than one missing, collate them, otherwise just print the number.

# Note that the input array may not be sorted and may contain numbers outside the range [0-99],
# but only this range is to be considered for printing missing elements.

# Examples

#      Input: {88, 105, 3, 2, 200, 0, 10}
#      Output: 1
#              4-9
#              11-87
#              89-99


#      Input: {9, 6, 900, 850, 5, 90, 100, 99}
#      Output: 0-4
#              7-8
#              10-89
#              91-98

def solve(array, from=0, to=99)
  skip = false
  count = 0
  result = [false] * (to - from)

  array.each do |element|
    result[element] = true if element.between?(from, to)
  end

  index = 0
  while index < to
    if result[index] == false && result[index + 1] != false
      puts "#{index}"
      index += 1
    elsif result[index] == false && result[index + 1] == false
      count = result[index..(-1)].take_while { |el| el == false }.count - 1
      puts "#{index} - #{index + count}"
      index += count + 1
    else
      index += 1
    end
  end
end
