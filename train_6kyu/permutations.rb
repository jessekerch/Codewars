# Problem:
# In this kata you have to create all permutations
# of a non empty input string and remove duplicates, if present.
# This means, you have to shuffle all letters from the input in
# all possible orders.
# input: string
# output: array of strings, all unique
# rules: no duplicates in output array
# must be all possible permutations of string
# input is all lowerscase english characters, at least in the examples given

# aabb 0, 1, 2, 3
# abab 0, 2, 1, 3
# abba 0, 2, 3, 1
# baab 


# Examples:

# * With input 'a'
# * Your function should return: ['a']
# * With input 'ab'
# * Your function should return ['ab', 'ba']
# * With input 'aabb'
# * Your function should return ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']

def factorial(n)
  n == 0? 1 : (1..n).inject(:*)
end

def permutations(str)
  perms = []
  str.chars.permutation(str.size) { |p| perms << p.join }
  perms.uniq
end

p permutations('a') #== 'a'
p permutations('ab') #== ['ab', 'ba']
p permutations('aabb') #== ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']