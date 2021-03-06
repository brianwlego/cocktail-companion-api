class Cocktail < ApplicationRecord
  has_many :measurements, :dependent => :delete_all
  has_many :ingredients, through: :measurements
  validates :name, :category, :glass, :instructions, :thumbnail, presence: true
  accepts_nested_attributes_for :measurements, allow_destroy: true 

end
