class Api::V1::ForecastController < ApplicationController

  def index
    if params[:location]
      location = MapquestFacade.create_coordinates(params[:location])
      forecast = OpenweatherFacade.create_forecast(location)

      render json: ForecastSerializer.new(forecast)
    else
      render json: { error: 'Location Required' }, status: 404
    end
  end
end
