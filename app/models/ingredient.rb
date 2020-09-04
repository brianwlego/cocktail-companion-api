class Ingredient < ApplicationRecord
  has_many :measurements
  has_many :cocktails, through: :measurements 
end
