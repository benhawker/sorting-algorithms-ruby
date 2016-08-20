# You have an array with N Elements. Initially, all the elements are zero.
# You can perform following operations on the array.
# 1.) Incremental operations:Choose 1 element from the array and increment its value by 1.
# 2.) Doubling operation: Double the values of all the elements of array.

# You are given a int[] desired array containing N elements.
# Compute and return the smallest possible number of the operations needed
# to change the array from all zeroes to desired array.
# Sample test cases:
# Input:{2,1}
# Output: 3
# one of the optimal solution is to apply the incremental operation 2 times to the element 0 and once to the element 1.
# Input: {16,16,16}
# Output: 7
# The output solution looks as follows. First apply an incremental operation to each element. Then apply the doubling operation four times. Total number of operations is 3+4=7
# Input:{100}
# Output:9
# Input:{0,0,1,0,1}
# Output: 2
# Input:{123,234,345,456,567,789}
# Output:40

# 1,1,1 2,2,2 4,4,4 8,8,8 16,16,16

# 1,1,1, 2 4 8 101010 20 40 80 100

##Infinite Loop!
def solve(array)
  zeros_array = [0] * array.size

  ##Starting point that we can try to beat is just adding 1's.
  min_operations = array.inject(:+)

  counter = 0
  until counter == 1000
  # until zeros_array == array
    operations = 0
    if can_double?(zeros_array, array)
      array.map { |element| element * 2 }
      operations += 1
    else
      # add_one(zeros_array, array)
      array.each_with_index do |element, index|
        count = 0
        if zeros_array[index] + 1 <= array[index]
           # false if zeros_array[index] == 0
          count += 1
        end
        break if count == 1
      end
      operations +=1
    end
    counter += 1
  end

  min_operations = operations if operations < min_operations
  return min_operations
end

def can_double?(zeros_array, array)
  array.each_with_index do |element, index|
    return false if zeros_array[index] * 2 > element
    return false if zeros_array[index] == 0
  end
  true
end
