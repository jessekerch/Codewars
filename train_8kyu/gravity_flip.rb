=begin
https://www.codewars.com/kata/5f70c883e10f9e0001c89673/train/ruby
If you've completed this kata already and want a bigger challenge, here's the 3D version

Bob is bored during his physics lessons so he's built himself a toy box to help pass the time.
The box is special because it has the ability to change gravity.

There are some columns of toy cubes in the box arranged in a line. The i-th column contains a_i cubes.
At first, the gravity in the box is pulling the cubes downwards. When Bob switches the gravity,
it begins to pull all the cubes to a certain side of the box, d, which can be either
'L' or 'R' (left or right). Below is an example of what a box of cubes might look like before
and after switching gravity.

+---+                                       +---+
|   |                                       |   |
+---+                                       +---+
+---++---+     +---+              +---++---++---+
|   ||   |     |   |   -->        |   ||   ||   |
+---++---+     +---+              +---++---++---+
+---++---++---++---+         +---++---++---++---+
|   ||   ||   ||   |         |   ||   ||   ||   |
+---++---++---++---+         +---++---++---++---+

Given the initial configuration of the cubes in the box, find out how many cubes
are in each of the n columns after Bob switches the gravity.

Examples (input -> output:

* 'R', [3, 2, 1, 2]      ->  [1, 2, 2, 3]
* 'L', [1, 4, 5, 3, 5 ]  ->  [5, 5, 4, 3, 1]

Problem:
input: 2 parameters: string and array
output: array
rules: 
first input is a string, either 'R' or 'L'
second input is an array of n numbers
output is an array of n numbers, rearranged

Examples:
[1, 4, 5, 3, 5] -> [5, 5, 4, 3, 1]
just sort them, duh

=end

def flip(dir, boxes)
  dir == "R" ? boxes.sort : boxes.sort.reverse
end

p flip('R', [3, 2, 1, 2]) == [1, 2, 2, 3]
p flip('L', [1, 4, 5, 3, 5 ]) == [5, 5, 4, 3, 1]
