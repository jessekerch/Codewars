=begin
Implement the function unique_in_order which takes as argument a sequence and
returns a list of items without any elements with the same value next to each
other and preserving the original order of elements.

Problem:
input: string or array (sequence)
output: array
rules: 
output array must not have any elements followed by element with same value
output must preserve original order of elements
input will be either letters and/or numbers
case sensitive

Example: 
AAAABBBCCDAABBB ->
A A A A B B B C C D A A B B B ->
A B C D A B ->
return

Data Structure:
input: string or array
output: array
intermediate: array

Steps:
if the input is a string, split into an array
(if it is already an array, it will remain an array)
initialize array "unique_chars"
iterate from 0 to array size - 2
check if array element at current index is different from the next element
if so, add the current element to unique_chars
check if last element of array is different from last element of unique_chars, if so add it
return unique_chars
=end

def unique_in_order(input)
  # input.class == String ? array = input.chars : array = input 
  unique_chars = []
  0.upto(input.size - 2) do |i|
    unique_chars << input[i] if input[i] != input[i + 1]
  end
  
  unique_chars << input[-1] unless input[-1] == unique_chars[-1]
  unique_chars
end

p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
p unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3])       == [1,2,3]
