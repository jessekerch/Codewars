=begin
https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby

Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer).
For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

Examples:

// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 


Problem:
input: hash x 2  (recipe ingredients, and available ingredients)
output: integer (or 0, not nil)
rules: 
input may include same number of ingredients or not
anything missing from ingredients should be considered zero
output should be a whole number, integer, number of cakes
output can be zero, not nil
units do not matter, just use the numbers
ingredietns are whole numbers, not floats or fractions
input hashes are entities with string keys and integer values


Examples:
{"flour"=>500, "sugar"=>200, "eggs"=>1}
{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200})
subtract --> make 1 cake or stop
{"flour"=>700, "sugar"=>100, "eggs"=>4, "milk"=>200})
again --> make 2nd cake or stop
{"flour"=>200, "sugar"=>0, "eggs"=>4, "milk"=>200})
stop --> total 2 cakes --> one of the ingredients is less than recipe
--> 2

So I could either make a helper method to check if we have enough ingredients
or I can just check on the fly. I guess I'll start with a helper method

Data:
input: hash and hash
output: integer
interm: maybe an array but I'm not sure yet

Steps:
Initialize total_cakes to zero, this will be the counter

Make sure I have all of the ingredients needed
  Check if available keys contain all of the recipe keys
  if not, return total_cakes at zero

Start a loop
  Iterate through recipe entities and subtract value from each available value
  If any of them end up as negative, break and explicitly return the total_cakes
  Else add 1 to total_cakes and keep looping
end loop

=end

def cakes(need, have)
  recipe = need.dup
  available = have.dup
  total_cakes = 0

  # if available keys doesn't contain all recipe keys, return 0
  unless recipe.keys.all? { |ingr| available.key?(ingr) }
    return total_cakes
  end
  
  # subtract recipe from available until an ingredient is <= 0
  loop do
    recipe.each do |ingr, amount|
      if available[ingr] >= amount
        available[ingr] -= amount
      else
        return total_cakes
      end
    end
    total_cakes += 1
  end  
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0

p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1

p cakes({"milk"=>16, "sugar"=>6, "chocolate"=>14, "crumbles"=>17, "butter"=>19, "eggs"=>20, "pears"=>16}, {"milk"=>70, "sugar"=>90, "chocolate"=>70, "crumbles"=>180, "butter"=>60, "eggs"=>190, "pears"=>60}) #== 3