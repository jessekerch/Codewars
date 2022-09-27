=begin
https://www.codewars.com/kata/52597aa56021e91c93000cb0/train/ruby
Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.

moveZeros [1,2,0,1,0,1,0,3,0,1] #-> [1,2,1,1,3,1,0,0,0,0]

=end

def moveZeros(arr) 
  arr.select{ |n| n != 0 } + arr.select { |n| n == 0 }
end

p moveZeros([1,2,0,1,0,1,0,3,0,1]) == [ 1, 2, 1, 1, 3, 1, 0, 0, 0, 0 ]