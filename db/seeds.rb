require "json"
require "open-uri"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
puts "Destroy"
Ingredient.destroy_all

puts "Generating ingredients"

10.times do
  random_ingredient = ingredients["drinks"].sample["strIngredient1"]
  ingredient = Ingredient.create!(name: random_ingredient)
  puts ingredient
end

10.times do
  other_ingredient = Ingredient.create!(name: Faker::Food.fruits)
  puts other_ingredient
end

puts "Done"
