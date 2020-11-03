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
    render json: cocktail, include: [:measurements, :ingredients]
  end

  def update
    cocktail = Cocktail.find(params[:id])
    measurements = Measurement.where(cocktail_id: params[:id])
    measurements.each {|m| m.destroy }
    cocktail.update(cocktail_params)

    render json: cocktail, include: [:measurements, :ingredients]
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :category, :glass, :user_made, :instructions, :thumbnail, :measurements_attributes => [
      :amount,
      :ingredient_id
    ])
  end

end