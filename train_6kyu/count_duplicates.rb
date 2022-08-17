def duplicate_count(string)
  string.downcase!
  uniq_array = string.chars.uniq
  multiple_count = 0

  uniq_array.each do |char|
    multiple_count += 1 if string.count(char) > 1
  end
  
  multiple_count
end

p duplicate_count("abcde") == 0
p duplicate_count("aabbcde") == 2
p duplicate_count("aabBcde") == 2
p duplicate_count("indivisibility") == 1
p duplicate_count("Indivisibilities") == 2
p duplicate_count("aA11") == 2
p duplicate_count("ABBA") == 2