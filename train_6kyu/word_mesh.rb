=begin
# Codewars: Word Mesh
# https://www.codewars.com/kata/5c1ae703ba76f438530000a2/train/ruby

# You will be given an array of strings. The words in the array should mesh
# together where one or more letters at the end of one word will have the same
# letters (in the same order) as the next word in the array. But, there are
# times when all the words won't mesh.

# Examples of meshed words:
# "apply" and "plywood"
# "apple" and "each"
# "behemoth" and "mother"

# Examples of words that do not mesh:
# "apply" and "playground"
# "apple" and "peggy"
# "behemoth" and "mathematics"

# If all the words in the given array mesh together, then your code should
# return the meshed letters in a string. You should return the longest common
# substring. You won't know how many letters the meshed words have in common,
# but it will be at least one.

# If any pair of consecutive words fails to mesh, your code should return
# "failed to mesh".

# Input: An array of strings. There will always be at least two words in the
# input array.

# Output: Either a string of letters that mesh the words together or the string
# "failed to mesh".

# Examples
# #1:
# ["allow", "lowering", "ringmaster", "terror"] --> "lowringter"
# because:
# the letters "low" in the first two words mesh together
# the letters "ring" in the second and third word mesh together
# the letters "ter" in the third and fourth words mesh together.
#
# #2:
# ["kingdom", "dominator", "notorious", "usual", "allegory"] --> "failed to mesh"
# Although the words "dominator" and "notorious" share letters in the same
# order, the last letters of the first word don't mesh with the first letters of
# the second word.

# Test Cases:
# p word_mesh(["beacon","condominium","umbilical","california"])== "conumcal"
# p word_mesh(["allow","lowering","ringmaster","terror"]) == "lowringter"
# p word_mesh(["abandon","donation","onion","ongoing"]) == "dononon"
# p word_mesh(["jamestown","ownership","hippocampus","pushcart","cartographer","pheromone"]) == "ownhippuscartpher"  

Problem:
input: array, array of string objects
output: string, meshed letters stuck together
rules:
mesh can be one or more characters
input array is lowercase alphabetical whitespace delimited words
output meshed letters joined together if they mesh
if they don't mesh, just output "failed to mesh"

Example:
# ["allow", "lowering", "ringmaster", "terror"] --> "lowringter"
allow -> allow? no, llow? no, low? yes
lowering -> 
ringmaster 

Data:
array input
string output
integer index

Steps:
initialize mesh to ""
check whether the ending of each word in the array fits the beginning of the next word
  check the reversed first word index 0 for length of word, and that same length of second word from index 0
    if the substring matches, save as "mesh" and move on
    if not, move to word index -1 for length of word -1, and check same length (then -2, -3, etc) until 1
for each word, add the meshed letters to the "mesh"
  retain the longest string that meshed, if there is one, in "mesh"
  repeat with all words
for each word, add the meshed letters to the "mesh"
return "mesh" or "failed to mesh"
=end

def longest_mesh(array, idx)
  0.upto(array[idx].size - 1) do |char_idx|
    curr_word = array[idx][char_idx..-1]
    next_word = array[idx + 1][0..(curr_word.size - 1)]
    return curr_word if curr_word == next_word
  end
  ""
end

def word_mesh(arr)
  mesh = ""
  0.upto(arr.size - 2) do |arr_idx|
    curr_mesh = longest_mesh(arr, arr_idx)
    return "failed to mesh" if curr_mesh == ""
    mesh += curr_mesh
  end
  mesh
end

p word_mesh(["beacon","condominium"]) == "con"
p word_mesh(["turtle","leisue","insurance"]) == "failed to mesh"
p word_mesh(["beacon","condominium","umbilical","california"]) == "conumcal"
p word_mesh(["allow","lowering","ringmaster","terror"]) == "lowringter"
p word_mesh(["abandon","donation","onion","ongoing"]) == "dononon"
p word_mesh(["jamestown","ownership","hippocampus","pushcart","cartographer","pheromone"]) == "ownhippuscartpher"  