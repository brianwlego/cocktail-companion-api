# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'unirest'


alpha = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'v', 'w', 'y', 'z']

alpha.each do |letter| 
  response = Unirest.get("https://www.thecocktaildb.com/api/json/v2/#{ENV['api_key']}/search.php?f=#{letter}")
  hash = response.body

    hash['drinks'].each do |drink|
      al = ""
      drink['strAlcoholic'] == "Alcoholic" ? al = true : al = false

      d = Cocktail.create(
        name: drink['strDrink'],
        category: drink['strCategory'],
        glass: drink['strGlass'],
        alcoholic: al,
        instructions: drink['strInstructions'],
        thumbnail: drink['strDrinkThumb']
      )
      ingredients_measurements = {
        drink['strIngredient1'] => drink['strMeasure1'], 
        drink['strIngredient2'] => drink['strMeasure2'], 
        drink['strIngredient3'] => drink['strMeasure3'],
        drink['strIngredient4'] => drink['strMeasure4'],
        drink['strIngredient5'] => drink['strMeasure5'],
        drink['strIngredient6'] => drink['strMeasure6'],
        drink['strIngredient7'] => drink['strMeasure7'],
        drink['strIngredient8'] => drink['strMeasure8'],
        drink['strIngredient9'] => drink['strMeasure9'],
        drink['strIngredient10'] => drink['strMeasure10'],
        drink['strIngredient11'] => drink['strMeasure11'],
        drink['strIngredient12'] => drink['strMeasure12'],
        drink['strIngredient13'] => drink['strMeasure13'],
        drink['strIngredient14'] => drink['strMeasure14'],
        drink['strIngredient15'] => drink['strMeasure15']
      }
      ingredients_measurements.each_pair do |key, value|
        if key && value 
          key = key.split.map(&:capitalize).join(' ')
          i = Ingredient.find_or_create_by(name: key)
          Measurement.create(amount: value, cocktail_id: d.id, ingredient_id: i.id)
        end
      end
    end
end




# cocktail1 =  Cocktail.create(name: "Old Fashion", category: "cocktail", glass: "rocks", alcoholic: true, instructions: "Make it strong.", thumbnail: "https://www.liquor.com/thmb/f_Fv27Y9k7zIofk_E6rhz37BpWQ=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__liquor__2018__05__08113350__bourbon-old-fashioned-720x720-recipe-ade6f7780c304999be3577e565c9bcdd.jpg", drink_id: 1)


# ingredient1 = Ingredient.create(name: 'Whiskey', description: "You know it, you love it.")

# measurements1 = Measurement.create(amount: "1.5 ounce", cocktail_id: 1, ingredient_id: 1)