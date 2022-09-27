# Implement a function that receives two IPv4 addresses,
# and returns the number of addresses between them (including the first one,
# excluding the last one).

# All inputs will be valid IPv4 addresses in the form of strings.
# The last address will always be greater than the first one.

# Problem:
# input: string of integers and dots 
# output: 


# Examples

# * With input "10.0.0.0", "10.0.0.50"  => return   50 
# * With input "10.0.0.0", "10.0.1.0"   => return  256 
# * With input "20.0.0.10", "20.0.1.0"  => return  246

# def ipsBetween(add_1, add_2)
#   rank = 768
#   add_1_val = value(add_1)
#   add_2_val = value(add_2)
#   diff = add_2_val - add_1_val
#   diff % 10 == 0 ? diff : diff - 1
# end  

def convert(addy)
  (256**3 * addy[0].to_i) + (256**2 * addy[1].to_i) +
  (256 * addy[2].to_i) + addy[3].to_i
end

def ipsBetween(add_1, add_2)
  convert(add_2.split('.')) - convert(add_1.split('.'))
end

p ipsBetween("10.0.0.0", "10.0.0.50") #== 50
p ipsBetween("10.0.0.0", "10.0.1.0") #== 256 # 
p ipsBetween("20.0.0.10", "20.0.1.0") # == 246
