=begin

Problem:
input:
output:
        
=end

# def order_weight(str)
#   arr = str.split
#   sorted_arr = []
#   arr.sort_by! { |st| st.to_i.digits.sum }
#   hash = {}
#   for num in arr do
#     if hash[num.to_i.digits.sum]
#       hash[num.to_i.digits.sum] << num
#     else
#       hash[num.to_i.digits.sum] = [num]
#     end
#   end
#   hash.each do |k, v|
#     sorted_arr << v.sort
#   end
#   sorted_arr.flatten.join(' ')
# end

def order_weight(str)
  str.split.sort_by { |st| [st.chars.map {|s| s.to_i}.sum, st] }.join(' ')
end

p order_weight("103 123 4444 99 2000") #== "2000 103 123 4444 99"
p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123") #== "11 11 2000 10003 22 123 1234000 44444444 9999"