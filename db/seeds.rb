# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
repos = JSON.parse(response)
# => repos is an `Array` of `Hashes`.

var = repos['drinks']

var.each do |key|
    # puts value
     ingredient = Ingredient.new(name: key['strIngredient1'])
     ingredient.save!
end

#sans rails
# require "json"
# require 'open-uri'


response = open("http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail").read
repos = JSON.parse(response)

var = repos['drinks']

var.each do |key|
    image = key['strDrinkThumb']
    cocktail = Cocktail.new(name: key['strDrink'])
    if image != nil
    cocktail.remote_photo_url = image
    else
    cocktail.remote_photo_url = "https://www.tuxboard.com/photos/2014/10/Cocktails.jpg"
  end
    cocktail.save!
end
