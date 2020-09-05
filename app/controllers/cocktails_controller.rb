class CocktailsController < ApplicationController

  def index
    cocktails = Cocktail.all
    render json: cocktails
  end

  def show
    cocktail = Cocktail.find(params[:id])
    render json: cocktail, include: [:measurements, :ingredients]
  end

end