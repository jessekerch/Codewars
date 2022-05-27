# def toJadenCase(input)
#   array = input.split
#   output = ""
#   count = 1

#   array.each do |word|
#     word.capitalize!
#     if count < array.length
#       output << word + " "
#     else
#       output << word
#     end
#     count += 1
#   end

#   return output
# end

class String
  def toJadenCase
    self.split.map(&:capitalize).join(" ")
  end
end

str = "How can mirrors be real if our eyes aren't real";
p str.toJadenCase()