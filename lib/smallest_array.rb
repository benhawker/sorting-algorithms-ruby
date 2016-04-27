# You have an array with N Elements. Initially, all the elements are zero.
# You can perform following operations on the array.
# 1.) Incremental operations:Choose 1 element from the array and increment its value by 1.
# 2.) Doubling operation: Double the values of all the elements of array.

# You are given a int[] desired array containing N elements. Compute and return the smallest possible number of the operations needed to change the array from all zeroes to desired array.
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