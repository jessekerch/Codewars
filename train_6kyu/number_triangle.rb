# # Consider the number triangle below, in which each number is equal to the number above plus the number to the left. If there is no number above, assume it's a 0.

# # 1
# # 1 1
# # 1 2 2
# # 1 3 5 5
# # 1 4 9 14 14

# # The triangle has 5 rows and the sum of the last row is sum([1,4,9,14,14]) = 42.

# # You will be given an integer n and your task will be to return the sum of the last row of a triangle of n rows.

# # In the example above:

# # solve(5) = 42

# PEDAC Template  6/20/2022

# PEDAC

# Understand the PROBLEM
#   - Input: Integer object, number of rows
#   - Output: Integer object, sum of last row 
#   - Rules: number of rows will be equal to n
#   - each number equal to sum of two numbers above and to the left 
#   - Build mental model of the problem
#   - Ask clarifying questions (not hints or help…)

# EXAMPLES
#   # Test.assert_equals(solve(4),14)
#   # Test.assert_equals(solve(5),42)
#   # Test.assert_equals(solve(6),132)
#   # Test.assert_equals(solve(7),429)
#   # Test.assert_equals(solve(8),1430)
#   # Test.assert_equals(solve(20),6564120420)

# DATA STRUCTURES
#   - Integer input
#   - Integer Output
#   - Two Arrays to keep track

# ALGORITHM
# - make a column variable starting at 1 (the 0 index element is always going to be 0)
# - use the index variable as an iteration column and index position
# - make an prev_arr with n + 1 elements, all 0 to start
#   - use a new method to do this, just to extract the code
#   - (n + 1).times loop through and shovel in a 0 to the array each time
#   - so if n is 5, there will be 6 elements, all 0 to start, this will remove any nil problem
# make an current_arr which starts as equal to array_1
#   - make sure to start calculating this so you don't have array_2 as all zeros as well
# loop n times, changing 0's to positive integers as you go
#   - iterate through and change each element in array_2 based on the calculation
#   - change as many elements as times you have gone through so keep another column
#   - calculate the element to change in array_2 and change the index position element from 0
#     - calculate by adding array_2[index - 1] + array_1[index]
#     - reassign array_2[index] as the above number
# reassign array_1 to array_2 so that you can keep track for the next iteration 
# add one to the index/column variable each iteration through
# return array_2 after the looping 
# return the sum of the array_2 final state

# CODING with intent
#   - go back to the Algorithm whenever needed
#   - test often (use irb, REPL)

# SCRATCHPAD
#   - need to pad the numbers with zeros to avoid adding 'nil'


def arr_of_zeros(count)
  array = []
  count.times do
    array << 0
  end
  array
end

def solve(rows)

  column = 1 # start at the 2nd element, leaving a 0 in the 1st element

  prev_arr = arr_of_zeros(rows + 1) # set up first array with n zeros
  prev_arr[column] = 1 # reassign 2nd element in the first array to a 1
  current_arr = prev_arr # second array equal to the first (i.e. [0, 1, 0..])

  rows.times do 
    index = 1

    column.times do
      current_arr[index] = current_arr[index - 1] + prev_arr[index]
      index += 1
    end

    prev_arr = current_arr

    column += 1
  end

  current_arr.sum
end

# TEST CASES
p solve(4) == 14
p solve(5) == 42
p solve(6) == 132
p solve(7) == 429
p solve(8) == 1430
p solve(20) == 6564120420