def str_2_hash(text)
  hash = {}
  array = text.split(', ')
  array.each do |set|
    k, v = set.split('=')
    hash[k.to_sym] = v.to_i
  end
  hash
end

# Please write a function that will take a string as input and return a hash.
# The string will be formatted as such.
# The key will always be a symbol and the value will always be an integer.

string = "a=1, b=2, c=3, d=4"
p str_2_hash(string) == { :a => 1, :b => 2, :c => 3, :d => 4}