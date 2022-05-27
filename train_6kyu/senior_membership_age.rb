#Jesse Kercheval
#May 23, 2022

# This was my solution but it's very long: 
# def open_or_senior(data)
#   membership = []
#   data.each { |person|
#   if ( person[0] >= 55 && person[1] > 7 )
#     membership.push("Senior")
#   else 
#     membership.push("Open")
#   end
#   }
#   return membership
# end
  
# This was the Best Practice solution, very elegant.
# I didn't know you could just jump into a nested array like that with .map straight to two arguments.
def open_or_senior(data)
  data.map { |age, handicap| age >= 55 && handicap > 7 ? "Senior" : "Open" }
end

input =  [[18, 20], [45, 2], [61, 12], [37, 6], [21, 21], [78, 9]]
# output = ["Open", "Open", "Senior", "Open", "Open", "Senior"]

p open_or_senior(input)

