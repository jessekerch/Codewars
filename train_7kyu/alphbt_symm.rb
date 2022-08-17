# https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0/train/ruby

# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

# Problem: 
# input: array object
#   - containing string objects
# output: array object, same number of elements
# rules: output array must contain numbers
#   - each number represents the count of characters in their correct alphabetical position
#   - capitalization doesn't matter insensitive
#   - no non-alphabetical characters

#   Examples:
#   a: string[0] => 0 # match
#   b: => 1 # match
#   o: => 14 # not a match
#   d: => 3 # match
#   e: => 4 # match
#   => 4 matches

#   ALGORITHM:
#   initialize a Constant variable which references the alphabet as a string
#   define method that takes one argument, an array
#   initialize an array to keep count integers
#   iterate through the array, assigning block parameter string to each array element
#   initialize a variable called count which will keep the number of matches
#   for each string check how many characters are in position
#     iterate through each string, with a block parameter index 
#       check the character at the string index position
#       if the character index position matches the same position of that character in my alphabet constant, add one to the number of matches
#   add final count to the array
#   return an array that contains integers


ALPHA = 'abcdefghijklmnopqrstuvwxyz'

def solve(array)
  count_arr = []

  array.each do |string|
    string.downcase! unless string.empty?
    count = 0
    for index in 0..string.size - 1
      count += 1 if string[index] == ALPHA[index]
    end

    count_arr << count
  end

  count_arr
end 