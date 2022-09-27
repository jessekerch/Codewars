=begin
# Your task is to sort a given string. Each word in the string will
# contain a single number. This number is the position the word should have
# in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the
# input String will only contain valid consecutive numbers.
# Examples

# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""

Problem:
input: string object
output: string object
rules:
input string will contain words with positive numbers from 1 to 9 in them
output string should be in order by those numbers in each word
input string may be one or more words separated by spaces, or empty
if input string is empty, return empty string

Examples:
"is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
"4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
""  -->  ""

Data Struc:
input: string
output: string
interm: array of string objects
  (some string objects will include integers, but I can leave those as strings)

Steps:
split input string into an array with whitespace as delim
iterate through array, checking each string element (word)
iterate through each word, checking each character if it is a number
  break each word into array of characters
  if character is included in "123456789" range, it is a number
sort array by the integer it contains
rejoin array of words into one string object with whitespaces as delim
=end

def order(words)
  words.split.sort_by { |w| w.chars.select { |c| (1..9).include?(c.to_i) }}.join(" ")
end

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""