class Api::V1::RoadTripController < ApplicationController
  include ParamsHelper

  def create
    user = User.find_by(api_key: params[:api_key])
    
    if user
      route_data = MapquestFacade.create_route(params[:origin], params[:destination])

      # weather_at_eta = OpenweatherFacade.create_weather_at_eta(params[:destination], travel_time)

      trip_data = RoadTrip.new(params[:origin], params[:destination], route_data) # weather_at_eta
      
      render json: RoadTripSerializer.format_road_trip(trip_data)
    else
      render json: { error: 'Invalid API Key' }, status: :unauthorized
    end
  end
end
