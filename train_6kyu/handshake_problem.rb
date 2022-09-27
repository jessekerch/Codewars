=begin
https://www.codewars.com/kata/5574835e3e404a0bed00001b/train/ruby
Johnny is a farmer and he annually holds a beet farmers convention "Drop the beet".

Every year he takes photos of farmers handshaking. Johnny knows that no two farmers handshake more than once. He also knows that some of the possible handshake combinations may not happen.

However, Johnny would like to know the minimal amount of people that participated this year just by counting all the handshakes.

Help Johnny by writing a function, that takes the amount of handshakes and returns the minimal amount of people needed to perform these handshakes (a pair of farmers handshake only once).

Problem:
input: integer object, number of handshakes
output: integer object, min number of people

Examples:
6 handshakes -> 1-2 3-4 1-4 2-3 1-3 2-4 
4 people is the minimum
So I guess I need to know the number of permutations I can get from 6 different figures?



=end


def get_participants(handshakes)
  num = handshakes
  count = 0
	until num <= 2 do
	  num /= 2
	  count += num
	  p count
	end
	count
end

# p get_participants(0) == 0
# p get_participants(1) == 2
# p get_participants(3) == 3
# p get_participants(6) == 4
p get_participants(7) #== 5
