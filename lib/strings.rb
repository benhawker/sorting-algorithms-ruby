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

## Given two strings, write a method to determine if one string is a permutation of the other
## Needs further logic - this is very wrong.
def permutation?(string_one, string_two)
  string_one = string_one.downcase.chars.sort
  string_two = string_two.downcase.chars.sort
  string_one != string_two ? true : false
end


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
## Ripe for a refactoring into a few separate methods.
## Needs testing.
def grid_builder(m, n)
  ## Builds a grid MXN filled with 1's.
  grid = Array.new(m) { Array.new(n) {1} }
  ## m times randomly populate it with some 0's
  m.times { grid[rand(m)][rand(n)] = 0 }

  ## Using for manual testing
  # grid[0][0] = 0
  # grid[1][0] = 0
  # grid[2][0] = 0
  # grid[3][0] = 0

  cols_to_zero = []
  rows_to_zero = []

  #Go through columns
  grid.each do |array|
    array.each_with_index do |element, index|
      if element == 0
        cols_to_zero << index
      end
    end
  end

  #Go through Rows
  grid.each_with_index do |array, index|
    if array.include?(0)
      rows_to_zero << index
    end
  end

  ## Make the deletions
  ## For each of the columns in cols_to_zero amend the grid to zero's.
  for i in cols_to_zero.uniq
    0.upto(grid.size - 1) do |row|
      grid[row][i] = 0
    end
  end

  ## For each of the values in the rows_to_zero array amend the existing grid using map!
  for i in rows_to_zero.uniq
    grid[0].map! { |element| 0 }
  end

  grid
end


#Rotate a 2-D NxN matrix by 90 degrees
def rotate(n)
  ## Builds a grid NXN filled with 0's.
  grid = Array.new(n) { Array.new(n) {0} }
  ## Builds new grid for output
  new_grid = Array.new(n) { Array.new(n) }

  ## Iterate through each array/row
  grid.each_with_index do |array, row|
    ## Then by each col of that row
    array.each_with_index do |element, col_index|
      new_grid[col_index][-(row+1)] = element
    end
  end
  new_grid
end

##+++++++

#Now do it in-place
## To follow.

