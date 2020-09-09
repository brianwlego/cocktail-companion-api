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
        thumbnail: drink['strDrinkThumb'], 
        user_made: false
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
  
def set_category(array)
  misc_names = ["Cream", "Milk", "Egg", "Sugar", "Peel", "Coffee", "Salt", "Wine", "Lime", "Anise", "Root", "Wormwood", "Ice", "Carrot", "Champagne", "Prosecco", "Ice-cream", "Sherry", "Flavoring", "Almond", "Grain Alcohol", "Coloring", "Glycerine",  "Maui", "Kirschwasser", "Corona", "Everclear", "Banana", "Yoghurt", "Honey", "Mini-snickers Bars", "Cantaloupe", "Port", "Vanilla", "Chocolate", "Extract", "Absinthe", "Cocoa Powder", "Cornstarch", "Olive Brine",  "Pepper", "Lavender", "Hot Damn", "Espresso", "Firewater", "Half-and-half", "Marshmallows", "Anis", "Jello", "Kiwi", "Papaya", "Asafoetida", "Mango", "Seed", "Cardamom", "Blackcurrant Squash", "Fennel Seeds", "Watermelon", "Maple Syrup", "Zima"]
  whiskey_names = ["Wild Turkey", "Bourbon", "Jack Daniels", "Crown Royal", "Southern Comfort", "Whiskey", "Whisky", "Jim Beam", "Yukon Jack"]
  scotch_names = ["Scotch", "Johnnie Walker"]
  vodka_names = ["Vodka", "Absolut"]
  gin_names = ["Gin"]
  rum_names = ["Rum", "Bacardi", "Cachaca"]
  tequila_names = ["Tequila", "Mezcal"]
  liqueur_names = ["Liqueur", "Grand Marnier", "Bailey", "Schnapps", "Pisang Ambon", "Kahlua", "Triple Sec", "Liqueur", "Creme De", "Frangelico", "Campari", "Benedictine", "Hpnotiq", "Curacao", "Chartreuse", "Kummel", "Goldschlager", "Sambuca", "Irish", "Galliano", "Heering", "Advocaat", "Tia Maria", "Passoa", "Falernum", "Cointreau", "Lillet Blanc", "St. Germain", "Raspberry Liqueur", "Lillet", "Apfelkorn", "Drambuie", "Anisette",  "Aquavit"]
  nonalc_names = ["Grenadine", "Syrup", "Sauce", "Bitters", "Sirup Of Roses"]
  digestif_names = ["Jägermeister", "Jagermeister",]
  garnish_names = ["Mint", "Cherry", "Candy", "Orange", "Pineapple", "Apricot",  "Allspice", "Cinnamon", "Coriander", "Leaves", "Ginger", "Lemon", "Berries", "Apple", "Cloves", "Nutmeg", "Strawberries", "Raisins", "Blueberries", "Cranberries", "Olive", "Fruit", "Basil", "Grapes", "Blackberries", "Cucumber", "Oreo Cookie", "Rosemary", "Orange Spiral"]
  vermouth_names = ["Vermouth", "Dubonnet Rouge"]
  brandy_names = ["Cognac", "Brandy", "Cordial", "Pisco"]
  aperitif_names = ["Amaretto", "Aperol", "Red Chili Flakes", "Butter", "Ricard", "Ouzo", "Pernod"]
  mixer_names = ["Water", "Juice", "Nectar", "Mix", "Sprite", "Lemonade", "Ale", "Soda", "Tea", "Sweet And Sour","Cider", "7-up",  "Mountain", "Beer", "Hot Chocolate", "Corona", "Surge", "Guinness", "Kool-aid", "Coca-cola", "Lager", "Punch", "Dr. Pepper", "Sarsaparilla", "Carbonated", "Schweppes", "Cola", "Tropicana", "Limeade"]
  
  
  array.each do |ingre|
    set_mixer_cat(mixer_names, ingre)
    set_misc_cat(misc_names, ingre)
    set_whiskey_cat(whiskey_names, ingre)
    set_scotch_cat(scotch_names, ingre)
    set_vodka_cat(vodka_names, ingre)
    set_gin_cat(gin_names, ingre)
    set_rum_cat(rum_names, ingre)
    set_tequila_cat(tequila_names, ingre)
    set_liqueur_cat(liqueur_names, ingre)
    set_nonalc_cat(nonalc_names, ingre)
    set_digestif_cat(digestif_names, ingre)
    set_garnish_cat(garnish_names, ingre)
    set_vermouth_cat(vermouth_names, ingre)
    set_brandy_cat(brandy_names, ingre)
    set_aperitif_cat(aperitif_names, ingre)
  end
end


def set_vodka_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Vodka" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_whiskey_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Whiskey" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_misc_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Miscellaneous" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_scotch_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Scotch" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_gin_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Gin" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_rum_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Rum" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_tequila_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Tequila" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_liqueur_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Liqueur" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_nonalc_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Non-Alcoholic" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_digestif_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Digestif" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_garnish_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Garnish" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_vermouth_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Vermouth" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_brandy_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Brandy" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_aperitif_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Aperitif" if ingre.name.include?("#{string}")
    ingre.save
  end
end
def set_mixer_cat(array, ingre) 
  array.each do |string|
    ingre.category = "Mixer" if ingre.name.include?("#{string}")
    ingre.save
  end
end

set_category(Ingredient.all)