# Problem:
# input: string
# output: string
# rules:
# output must have words longer than 5 characters reversed (spun)
# do not consider spaces 
# input strings will be only letters and spaces
# input string may be only one word and no spaces

# Examples:
# Hey fellow warriors ->
# Hey, fellow, warriors ->
# Hey, wollef, sroirraw ->
# Hey wollef sroirraw

# Data Structures: 
# input: string, output: string
# intermediated: array of substrings

# Algorithm:
# define method that takes one parameter, string object
# split input string object into array of substrings, words, with whitespace delimiter
# initialize a new array for holding modified words
# iterate through array, mutating the array as I go
#   check length of each element (each word)
#   if length is 5 or greater, spin the word
#     spin by reversing the order of the characters in the string
#     add the reversed string to the new array
#   otherwise 
#     add the word to the array, anything shorter than 5 characters
# join the new array into one string object, with " " as a delimiter
# return new string object


def spin_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse! : word }.join(' ')
end

p spin_words("Hey fellow warriors" ) == "Hey wollef sroirraw" 
p spin_words( "This is a test") == "This is a test" 
p spin_words( "This is another test" ) == "This is rehtona test"
