class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])

    if user.present?
      travel_time = MapquestFacade.get_travel_time(params[:origin], params[:destination])

      weather_at_eta = OpenweatherFacade.create_weather_at_eta(params[:destination], travel_time)

      road_trip = RoadTrip.new(params[:origin], params[:destination], travel_time, weather_at_eta)

      render json: RoadTripSerializer.new(road_trip)
    else
      render json: { error: 'Api Key Incorrect or Missing' }, status: :unauthorized
    end
  end
end
