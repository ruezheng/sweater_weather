class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])

    if user.present?
      route_data = MapquestFacade.get_travel_time(params[:origin], params[:destination])

      weather_at_eta = OpenweatherFacade.create_weather_at_eta(params[:destination], travel_time)

      road_trip = RoadTrip.new(params[:origin], params[:destination], route_data)

      render json: RoadTripSerializer.new(road_trip, weather_at_eta)
    else
      render json: { error: 'Api Key Incorrect or Missing' }, status: :unauthorized
    end
  end
end
