=begin
https://www.codewars.com/kata/5f849ab530b05d00145b9495/train/ruby
This kata is a slightly harder version of Gravity Flip. It is recommended
to do that first.

Bob is bored in his physics lessons yet again, and this time, he's brought a
more complex gravity-changing box with him. It's 3D, with small cubes arranged
in a matrix of n×m columns. It can change gravity to go in a certain direction,
which can be 'L', 'R', 'D', and 'U' (left, right, down, and up).

Given the initial configuration of the cubes inside of the box as a 2D array,
determine how the cubes are arranged after Bob switches the gravity.

See the sample tests for examples.

BOX = [ [1, 3, 2],
        [4, 5, 1],
        [6, 5, 3],
        [7, 2, 9] ]
        
flip('R', BOX) ==
      [ [1, 2, 3],
        [1, 4, 5],
        [3, 5, 6],
        [2, 7, 9] ])
        
flip('L', BOX) ==
      [ [3, 2, 1],
        [5, 4, 1],
        [6, 5, 3],
        [9, 7, 2] ])

(flip('U', BOX) ==
      [ [7, 5, 9],
        [6, 5, 3],
        [4, 3, 2],
        [1, 2, 1] ])

flip('D', BOX) ==
      [ [1, 2, 1],
        [4, 3, 2],
        [6, 5, 3],
        [7, 5, 9] ])

Problem:
input: two: string and array of arrays
output: array of arrays, rearranged
rules:
first given argument can be 'R', 'L', 'U', or 'D'
array of arrays will always be positive numbers arranged in arrays
output order will be changed based on the string RLUD

Examples:
R and L are easy, just sort or sort reverse each array
U? look at first element of each array, and sort, then repeat with 2nd and 3rd
D? look at first eleemnt of each array and sort reverse, then repeat with 2nd and 3rd

Data Struc:
input: string, and array of arrays
output: array of arrays
intermed: arrays and nested arrays

Steps:
If the first input is 'R'
  sort each of the arrays
If the first input is 'L'
  sort and reverse each of the arrays
If the first input is 'U'
If the first input is 'D'
  iterate through the arrays (each element of dir)
    for each nested array, iterate from 0 up to the size of the array - 1
      for each number
=end

BOX = [ [1, 3, 2],
        [4, 5, 1],
        [6, 5, 3],
        [7, 2, 9] ]

# def flip(dir, box)
#   case dir
#   when 'R' then box.map { |row| row.sort }
#   when 'L' then box.map { |row| row.sort.reverse }
#   when 'U' then box.transpose.map { |row| row.sort.reverse }.transpose
#   when 'D' then box.transpose.map { |row| row.sort } .transpose
#   end
# end

# First solution that worked, 10:30am 8/3/2022
def flip(dir, box)
  case dir
  when 'R' then box.map { |arr| arr.sort }
  when 'L' then box.map { |arr| arr.sort.reverse }
  when 'U'
    new_box = []
    0.upto(box[0].size - 1) do |col_idx|
      column = []
      0.upto(box.size - 1) do |row_idx|
        column << box[row_idx][col_idx]
      end
      new_box << column.sort.reverse
    end
    col_to_row(new_box)

  when 'D'
    new_box = []
    0.upto(box[0].size - 1) do |col_idx|
      column = []
      0.upto(box.size - 1) do |row_idx|
        column << box[row_idx][col_idx]
      end
      new_box << column.sort
    end
    col_to_row(new_box)
  end
end

def col_to_row(array)
  switched_arr = Array.new(array[0].count) { [] }
  0.upto(array.size - 1) do |row|
    0.upto(array[0].size - 1) do |column|
      switched_arr[column] << array[row][column]
    end
  end
  switched_arr
end

p flip('R', BOX) ==
      [ [1, 2, 3],
        [1, 4, 5],
        [3, 5, 6],
        [2, 7, 9] ]
        
p flip('L', BOX) ==
      [ [3, 2, 1],
        [5, 4, 1],
        [6, 5, 3],
        [9, 7, 2] ]
        
p flip('U', BOX) ==
      [ [7, 5, 9],
        [6, 5, 3],
        [4, 3, 2],
        [1, 2, 1] ]

p flip('D', BOX) ==
      [ [1, 2, 1],
        [4, 3, 2],
        [6, 5, 3],
        [7, 5, 9] ]
        
