=begin
https://www.codewars.com/kata/55e2adece53b4cdcb900006c/train/ruby
Two tortoises named A and B must run a race. A starts with an average speed of 720 feet per hour. Young B knows she runs faster than A, and furthermore has not finished her cabbage.

When she starts, at last, she can see that A has a 70 feet lead but B's speed is 850 feet per hour. How long will it take B to catch A?

More generally: given two speeds v1 (A's speed, integer > 0) and v2 (B's speed, integer > 0) and a lead g (integer > 0) how long will it take B to catch A?

The result will be an array [hour, min, sec] which is the time needed in hours, minutes and seconds (round down to the nearest second) or a string in some languages.

If v1 >= v2 then return nil, nothing, null, None or {-1, -1, -1} for C++, C, Go, Nim, Pascal, COBOL, Erlang, [-1, -1, -1] for Perl,[] for Kotlin or "-1 -1 -1".
Examples:

(form of the result depends on the language)

race(720, 850, 70) => [0, 32, 18] or "0 32 18"
race(80, 91, 37)   => [3, 21, 49] or "3 21 49"

Note:

    See other examples in "Your test cases".

    In Fortran - as in any other language - the returned string is not permitted to contain any redundant trailing whitespace: you can use dynamically allocated character strings.

** Hints for people who don't know how to convert to hours, minutes, seconds:

    Tortoises don't care about fractions of seconds
    Think of calculation by hand using only integers (in your code use or simulate integer division)
    or Google: "convert decimal time to hours minutes seconds"


Problem:
input: three integers
output: array of three integers
rules:
output is hours, minutes, seconds
input is speed 1, speed 2, and distance or gap lead time
return nil if v1 >= v2
all inputs will be integers > 0

Example:
v1 = 720 ft/hr
v2 = 850 ft/hr
g = 70 ft

So how long would it take for t2 to catch t1 if t1 were standing still? 
850 ft/hr = 14 ft/min and 70 ft / 14 ft/min = 5 minutes
then you need to add the additional distance t1 goes in that time
5 min * 12 ft/min (t1 is 720/60=12 ft/min) = 60 ft
so that will take another 60/14 = 4 min
then you need that additional distance t1 goes in that time
4 * 12 ft = 48 / 14 = 3 min
3 * 12 = 36 / 14 = 2 min
2 * 12 = 24 / 14 = 1 min
1 * 12 = 12 / 14 == <0 so no more
But this doesn't work because I'm supposed to go to seconds.
Try this again but with seconds? Yes but let's use Ruby please....

TRY AGAIN
3600 sec * 70 ft / 850 ft/hr = 296 seconds
720 ft/hr * 296 sec / 3600 = 59 ft
3600 * 56 / 850 = 237 sec
720 * 237 / 3600 = 47 ft


Data:
input: integers x 3
output: array
intermediate: nothing else needed I think

Steps:
v1, v2, g
set a return value "total_time" = 0
until g < 1 loop
  time = 3600 * g / v2
  g = v1 * time / 3600
  total_time += time
end loop
return total_time

TRY AGAIN!
time = g / (v1 - v2) * 3600
time = 1938 sec


def seconds_conv(total_time)
  hours = total_time.to_i
  total_time -= hours
  min = (total_time * 60).to_i
  sec = (((total_time * 60) - min) * 60).to_i
  [hours, min, sec]
end

def race(v1, v2, gap)
  return nil if v1 >= v2
  time = gap.to_f / (v2.to_f - v1.to_f)
  seconds_conv(time) 
end

# Code:
def convert(total_time)
  hours = total_time / 3600
  total_time -= hours * 3600
  min = total_time / 60
  sec = total_time - (min * 60)
  [hours, min, sec]
end

def race(v1, v2, gap)
  return nil if v1 >= v2
  v2_secs = v2 / 3600.to_f
  v1_secs = v1 / 3600.to_f
  time_secs = gap.to_f / (v2_secs.to_f - v1_secs.to_f)
  time_secs = time_secs.floor
  convert(time_secs)
end

def race(v1, v2, lead)
  return nil if v1 > v2
  time_in_seconds = (lead.fdiv(v2 - v1) * 3600).to_i
  hour = (time_in_seconds / 3600)
  min  = (time_in_seconds / 60 ) % 60
  sec  =  time_in_seconds % 60
  [hour,min,sec]
end

=end

def race(v1, v2, g)
  sec = (g * 3600 / (v2 - v1))
  [sec / 3600,  (sec / 60) % 60, sec % 60] if v2 > v1
end

p race(720, 850, 70) #== [0, 32, 18])
p race(80, 91, 37) #== [3, 21, 49])
p race(80, 100, 40) #== [2, 0, 0])