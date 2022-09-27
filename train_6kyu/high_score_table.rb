# Richard's gravity flip 3d from codewars
# This is his helper method which is used to transpose the rows and columns
# Transpose an Array
# arr = [ [1, 2, 3],
#         [4, 5, 6],
#         [7, 8, 9] ]
# transposed_arr = [ [1, 4, 7],
#                    [2, 5, 8],
#                    [3, 6, 9] ]
def transpose(arr)
  transposed_arr = Array.new(arr.size) { [] }
  arr.each do |curr_subarr|
    curr_subarr.each_with_index do |curr_val, curr_idx|
      transposed_arr[curr_idx] << curr_val
    end
  end

  transposed_arr
end

p transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == 
[[1, 4, 7], [2, 5, 8], [3, 6, 9]]