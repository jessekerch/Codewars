#from Richard Lee 8.23.2022

# Codewars: Pick Peaks (5 kyu)
# https://www.codewars.com/kata/5279f6fe5ab7f447890006a7/train/ruby

# In this kata, you will write a function that returns the positions and the
# values of the "peaks" (or local maxima) of a numeric array.
# 
# For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with
# a value of 5 (since arr[3] equals 5).
# 
# The output will be returned as an object with two properties: pos and peaks.
# Both of these properties should be arrays. If there is no peak in the given
# array, then the output should be {pos: [], peaks: []}.
# 
# Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos:
# [3, 7], peaks: [6, 3]} (or equivalent in other languages)
# 
# All input arrays will be valid integer arrays (although it could still be
# empty), so you won't need to validate the input.
# 
# The first and last elements of the array will not be considered as peaks (in
# the context of a mathematical function, we don't know what is after and
# before and therefore, we don't know if it is a peak or not).
# 
# Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3]
# and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the
# position and value of the beginning of the plateau. For example:
# pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in
# other languages)

=begin
Problem:
input: array of integer objects
output: hash with two entities (one the pos, peaks)
rules:
input array always valid, or empty
output arrays: 
 pos: index positions of peaks
 peaks: integers, highest numbers of peaks
 peak define: number is higher than number to its left, and number to right is not higher
 start or end array elements cannot be peaks
 pos is the index of the array
 
Examples:
[2,1,3,1,2,2,2,2]
2-> first
1-> 3
3-> 1 # PEAK? 
2-> 2 
2-> 2
2-> end no more peaks
pos: 2, peak: 3

Data Structure: 
input: array
output: hash
intermed: 

Steps:
if input array is empty, return empty arrays in hash values
initialize peak array as empty array "peaks"
initialize positions array as empty array "pos"
iterate index positions from 1 up to size of array -2 to find peaks in input array
  acquire prev number, mid number, and next number
    use index -1, current index, and index + 1 of input array
  if mid element is higher than prev element and >= next element, it is a peak
    add mid number to peak array
    add index number to pos array
return hash of pos and peaks and associated arrays
=end

def pick_peaks(arr)
  return {"pos"=>[], "peaks"=>[]} if arr.empty?
  pos = []
  peaks = []
  
  # record all pos and peaks in input array, including plateaus
  1.upto(arr.size - 2) do |idx|
    if arr[idx] > arr[idx - 1] && arr[idx] >= arr[idx + 1] 
      pos << idx
      peaks << arr[idx]
    end  
  end

  
  {"pos" => pos, "peaks" => peaks}
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}
p pick_peaks([2,1,3,1,2,2,2,2,3,1]) == {"pos"=>[2, 8], "peaks"=>[3, 3]}