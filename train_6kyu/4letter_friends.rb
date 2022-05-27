#Jesse Kercheval
#May 23, 2022
#Codewars trying for the first time
# I learned to use Regex with .match? to check if the string is letters

def friend(friends = [])
  friends.select { |name| name.to_s.length == 4 && name.match?(/[[:alpha:]]/) }
end

