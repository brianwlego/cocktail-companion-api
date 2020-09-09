class IngredientsController < ApplicationController 

  def index
    ingredients = Ingredient.all
    render json: ingredients, include: [:cocktails]
  end


  def show
    ingredient = Ingredient.find(params[:id])
    render json: ingredient, include: [:cocktails, :measurements]
  end
end