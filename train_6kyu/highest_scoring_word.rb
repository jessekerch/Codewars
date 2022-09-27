=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

Problem:
input: string, a sentence of words
output: string, one word
rules: 
output should be highest scoring word
letters count for points based on their alphabet position
all input characters are english lowercase, or spaces

Data Structures:
input: string
output: string
interm: array

Steps:
split the input string into an array
initialize high_score variable to value 0
initialize high_word to first element of array
iterate through the array, checking each word
  calculate the total value of each word

  => helper method word_score
  set total score variable to 0
  iterate through each character of the word
  add character score to word score
    character score is the ordinal value - 96
  return word score

  if this word score is higher than high_score, reassign
  also reassign high_word to this word
return high_word variable with the highest value word
=end

def high(string)
  array = string.split
  high_score = 0
  high_word = array[0]
  array.each do |word|
    if word_score(word) > high_score
      high_score = word_score(word)
      high_word = word
    end
  end
  high_word
end

def word_score(str)
  total = 0
  str.each_char do |c|
    total += (c.ord - 96)
  end
  total
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aa b') == 'aa'
p high('b aa') == 'b'
p high('bb d') == 'bb'
p high('d bb') == 'd'
p high('aaa b') == 'aaa'
p high(' ') #== ''
