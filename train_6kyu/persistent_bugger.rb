=begin
https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence,
which is the number of times you must multiply the digits in num until you reach a single digit.

For example (Input --> Output):

39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
4 --> 0 (because 4 is already a one-digit number)

Problem:
input: integer, n
output: integer, times

rules:
input is a positive integer
output is number of times to multiply digits to reach a single digit
single digit n input should output zero

Examples:
39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
4 --> 0 (because 4 is already a one-digit number)

Data:
input: integer
output: integer
interm: array of digits in number

Steps:
iniitalize number of times variable to 0
split input n into array of digits
check if result is one digit, if not repeat, if so return number of times
multiply digits together


=end

def persistence(n)
  times = 0
  loop do
    array = n.digits
    break if array.size == 1
    times += 1
    n = array.reduce(:*)
  end
  times
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
p persistence(444) == 3
