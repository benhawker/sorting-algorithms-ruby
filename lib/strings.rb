## Determine if a string has all unique characters
def all_unique?(string)
  hash = {}
  array = string.downcase.split(//)

  array.each do |letter|
    return false if hash[letter]
    hash[letter] = true
  end
  true
end

def all_unique_two?(string)
  string.downcase.chars.sort.each_with_index do |letter, index|
    if string[index] == string[index + 1]
      return false
    else
      return true
    end
  end
end

## Reverse a string in place

## Given two strings, write a method to determine if one string is a permutation of the other


## Write a function that compresses a string from aaabbcc => a3b2c2
def string_compressor(string)
  array = string.split(//).sort
  count = 1
  result = ""

  array.each_with_index do |letter, index|
    if array[index] == array[index + 1]
      count += 1
    elsif array[index] != array[index + 1]
      result << letter + count.to_s
      count = 1
    end
  end
  result
end

def string_compressor_two(string)
  hash = {}
  array = string.split(//).sort

  count = 1
  array.each_with_index do |letter, index|
    if array[index] == array[index + 1]
      count += 1
    elsif array[index] != array[index + 1]
      hash[letter] = count
      count = 1
    end
  end
  hash.flatten.join("")
end


#Given a 2-D grid of size MxN, make every row and column that has a 0 in it become all 0s
#Do it now with O(1) space complexity
#Rotate a 2-D NxN matrix by 90 degrees
#Now do it in-place