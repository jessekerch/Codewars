# https://www.codewars.com/kata/5266876b8f4bf2da9b000362

# You probably know the "like" system from Facebook and other pages.
# People can "like" blog posts, pictures or other items.
# We want to create the text that should be displayed next to such an item.

# Implement the function which takes an array containing the names of people that like an item.
# It must return the display text as shown in the examples:

# []                                -->  "no one likes this"
# ["Peter"]                         -->  "Peter likes this"
# ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
# ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
# ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

# Note: For 4 or more names, the number in "and 2 others" simply increases.

# PEDAC

# Understand the PROBLEM
# # Implement the function which takes an array containing the names of people that like an item.
#   - Input: array of strings
#   - Output: string
#   - Rules: 
#     - 0 names, output that no one likes it
#     - 1 to 3 elements, output all names
#     - 4 or more elements, output first 2 names and count of others (likes - 2)
  
#   - Build mental model of the problem
#   - Ask clarifying questions (not hints or help…)

# EXAMPLES
#   - Provided examples. Notice the details
#   - Potential pitfalls? e.g. divide by zero, invalid input, etc

# DATA STRUCTURES
#   - array input
#     - strings of capitalized names as elements in the input array
#   - string output
#     - interpolated names and an integer in some cases

# ALGORITHM
#   - count the number of elements (names) in the given array
#   - depending on the count, output the names and sometimes number of likes
#     - use case 
#       - when no names, output no one likes it
#       - when one name, output that the name likes it
#       - when two names, output names with and separator
#       - when three names, output names with comma and and separators
#       - when four or more names (else), output first two names and likes - 2 integer

# CODING with intent
#   - go back to the Algorithm whenever needed
#   - test often (use irb, REPL)

# SCRATCHPAD
#   - maybe use case i.e. when 0 elements, when 1 element, etc
#   - count method will give the number of elements in an array
  
def likes(names)
  case names.count
  when 0
    "no one likes this"
  when 1
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{(names.count - 2)} others like this"
  end
end

p likes([]) == "no one likes this"
p likes(["Peter"]) == "Peter likes this"
p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"