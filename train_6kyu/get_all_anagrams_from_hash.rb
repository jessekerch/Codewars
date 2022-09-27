=begin
https://www.codewars.com/kata/543e926d38603441590021dd
Given a hash of letters and the number of times they occur, recreate all of the possible anagram combinations that could be created using all of the letters, sorted alphabetically.

The inputs will never include numbers, spaces or any special characters, only lowercase letters a-z.

E.g. get_words({2=>["a"], 1=>["b", "c"]}) => ["aabc", "aacb", "abac", "abca", "acab", "acba", "baac", "baca", "bcaa", "caab", "caba", "cbaa"]

Problem:
input: hash
ouput: array
rules:
input has integer keys, and array of strings values
output array of strings, all possible anagrams of letters
have to use all letters

Example:
E.g. get_words({2=>["a"], 1=>["b", "c"]}) => ["aabc", "aacb", "abac", "abca", "acab", "acba", "baac", "baca", "bcaa", "caab", "caba", "cbaa"]

Data:
input: hash
ouput: array
interm: strings

Steps:
make hash into array of characters
  
combine characters in all possible ways 
add all possible ways to an array of anagrams
return anagrams array


=end

def get_words(hash)
  letters = ""
  hash.each { |k, v| v.each { |char| letters += char * k } }
  anagrams = [letters]
  letters.chars.permutation { |per| anagrams << per.join }
  anagrams.uniq.sort
end

p get_words({1=>["a", "b", "c"]}) == ["abc", "acb", "bac", "bca", "cab", "cba"]
p get_words({2=>["a"], 1=>["b", "c"]}) == ["aabc", "aacb", "abac", "abca", "acab", "acba", "baac", "baca", "bcaa", "caab", "caba", "cbaa"]


