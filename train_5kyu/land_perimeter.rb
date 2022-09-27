=begin
https://www.codewars.com/kata/5839c48f0cf94640a20001d3/train/ruby
Given an array arr of strings complete the function landPerimeter by calculating the total perimeter of all the islands.
Each piece of land will be marked with 'X' while the water fields are represented as 'O'.
Consider each tile being a perfect 1 x 1piece of land. Some examples for better visualization:

Problem:
input: array of strings
output: string, with integer of total perimeter interpolated

EXAMPLES:
TOTAL 9 [* 4] = 36
'XOOXO'
'XOOXO'
'OOOXO'
'XXOXO'
'OXOOO'

ABOVE x 5 [* 2] = -10
'XOOXO' -> DON'T CHECK 1st row
'XOOXO' - 4
'OOOXO' - 2
'XXOXO' - 2
'OXOOO' - 2

RIGHT x 1 [* 2] = -2
'XOOXO' - 0
'XOOXO' - 0
'OOOXO' - 0
'XXOXO' - 2
'OXOOO' - 0


should return: "Total land perimeter: 24",

while

['XOOO',

  'XOXO',

  'XOXO',

  'OOXX',

  'OOOO']

should return: "Total land perimeter: 18"
Good luck!

STEPS:
Initialize perimeter variable to hold total perimeter
TOTAL: Calculate total land pieces * 4 and add to perimeter
TOPS: Calculate land pieces on rows 2+ with adjacent land above, -2 for each from perimeter
RIGHTS: Calculate land pieces with adjacent land to the right, -2 for each from perimeter
RETURN: "Total land perimeter: PERIMETER VARIABLE"

=end

def tops(array)
  tops = 0
  1.upto(array.size - 1) do |row|
    0.upto(array[row].size - 1) do |col|
      tops += 1 if array[row][col] == "X" && array[row - 1][col] == "X"
    end  
  end
  tops * 2
end

def rights(array)
  rights = 0
  0.upto(array.size - 1) do |row|
    0.upto(array[row].size - 2) do |col|
      rights += 1 if array[row][col] == "X" && array[row][col + 1] == "X"
    end  
  end
  rights * 2
end

def land_perimeter(land)
  perimeter = 0
  land.each { |row| perimeter += (row.count("X") * 4) }

  perimeter -= tops(land)

  perimeter -= rights(land)
  
  "Total land perimeter: #{perimeter}"
end


p land_perimeter(["OXOOOX", "OXOXOO", "XXOOOX", "OXXXOO", "OOXOOX", "OXOOOO", "OOXOOX", "OOXOOO", "OXOOOO", "OXOOXX"]) == "Total land perimeter: 60"
p land_perimeter(["OXOOO", "OOXXX", "OXXOO", "XOOOO", "XOOOO", "XXXOO", "XOXOO", "OOOXO", "OXOOX", "XOOOO", "OOOXO"]) == "Total land perimeter: 52"
p land_perimeter(["XXXXXOOO", "OOXOOOOO", "OOOOOOXO", "XXXOOOXO", "OXOXXOOX"]) == "Total land perimeter: 40"
p land_perimeter(["XOOOXOO", "OXOOOOO", "XOXOXOO", "OXOXXOO", "OOOOOXX", "OOOXOXX", "XXXXOXO"]) == "Total land perimeter: 54"
p land_perimeter(["OOOOXO", "XOXOOX", "XXOXOX", "XOXOOO", "OOOOOO", "OOOXOO", "OOXXOO"]) == "Total land perimeter: 40"