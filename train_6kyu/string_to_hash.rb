def str_2_hash(text)
  index = 0
  sym_arr = []
  num_arr = []
  while index < text.length
    sym_arr << text[index].to_sym if text[index] =~ /[a-z]/
    num_arr << text[index].to_i if text[index] =~ /[0-9]/
    index += 1
  end
  sym_arr.zip(num_arr).to_h
end

# Please write a function that will take a string as input and return a hash.
# The string will be formatted as such.
# The key will always be a symbol and the value will always be an integer.

string = "a=1, b=2, c=3, d=4"
p str_2_hash(string) == { :a => 1, :b => 2, :c => 3, :d => 4}