def alphabetized(string)
  array = []
  string.each_char do |c|
    array << c if 'abcdefghijklmnopqrstuvwxyz'.include?(c.downcase)
  end
  array.sort_by! { |c| c.downcase }
  array.join
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
