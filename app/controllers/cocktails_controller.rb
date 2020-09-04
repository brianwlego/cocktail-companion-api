class CocktailsController < ApplicationController

  def index
    cocktails = Cocktail.all
    render json: cocktails, include: [:measurements, :ingredients]
  end

end