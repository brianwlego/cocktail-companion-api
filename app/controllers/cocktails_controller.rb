class CocktailsController < ApplicationController

  def index
    cocktails = Cocktail.all
    render json: cocktails
  end

  def show
    cocktail = Cocktail.find(params[:id])
    render json: cocktail, include: [:measurements, :ingredients]
  end

  def create
    cocktail = Cocktail.create(cocktail_params)
    render json: cocktail
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :category, :glass, :alcoholic, :instructions, :thumbnail)
  end

end