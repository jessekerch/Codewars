def anagram_difference(str1, str2)
  size1 = str1.size
  size2 = str2.size
  anagram_arr = str1.chars & str2.chars
  (str1.chars.size - anagram_arr.size) + (str2.chars.size - anagram_arr.size)
end


p anagram_difference('', ''), 0)
p anagram_difference('a', ''), 1)
p anagram_difference('', 'a'), 1)
p anagram_difference('ab', 'a'), 1)
p anagram_difference('ab', 'ba'), 0)
p anagram_difference('ab', 'cd'), 4)
p anagram_difference('aab', 'a'), 2)
p anagram_difference('a', 'aab'), 2)
p anagram_difference('codewars', 'hackerrank'), 10)