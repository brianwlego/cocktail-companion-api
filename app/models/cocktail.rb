class Cocktail < ApplicationRecord
  has_many :measurements
  has_many :ingredients, through: :measurements 
end
