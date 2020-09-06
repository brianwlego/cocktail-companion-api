class MeasurementsController < ApplicationController 

  def create
    measurement = Measurement.create(measurement_params)
    render json: measurement
  end


  private

  def measurement_params
    params.require(:measurement).permit(:amount, :cocktail_id, :ingredient_id)
  end

end