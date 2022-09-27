=begin
Write a function that takes an integer as input, and returns the number of
bits that are equal to one in the binary representation of that number.
You can guarantee that input is non-negative.

Example: The binary representation of 1234 is 10011010010,
so the function should return 5 in this case

.to_s(2)

Problem:
input: integer
output: integer
rules: count 1's in the binary conversion of the input
rules: input can be zero, but not negative

Examples:
4 -> "100"
"100"-> ["1", "0", "0"]
number of "1" = 1

Data Structure:
input: integer
output: integer

Steps:
convert input integer to binary string
check count of "1" in the string
output the integer version of the count

=end
def count_bits(int)
  int.to_s(2).count("1")
end

p count_bits(0) == 0
p count_bits(4) == 1
p count_bits(7) == 3
p count_bits(9) == 2
p count_bits(10) == 2
