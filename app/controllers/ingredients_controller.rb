class IngredientsController < ApplicationController 

  def index
    ingredients = Ingredient.all
    render json: ingredients
  end

  private

  def titlieze(ingredients)
    stop_words = %w(and in the of an an)
    ingredients.each do |ingredient| 
      ingredient[:name].split.map(&:capitalize).join(' ')
      # byebug
    end
  end
end