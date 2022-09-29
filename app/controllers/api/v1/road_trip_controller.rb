class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      destination = MapquestFacade.create_coordinates(params[:road_trip][:destination])
      
      travel_time = MapquestFacade.create_travel_time(params[:road_trip][:origin], params[:road_trip][:destination])
      
      weather_at_eta = OpenweatherFacade.create_weather_at_eta(destination, travel_time)

      trip_data = RoadTrip.new(params[:road_trip][:origin], params[:road_trip][:destination], travel_time)
      
      render json: RoadTripSerializer.format_road_trip(trip_data, weather_at_eta)
    else
      render json: { error: 'Invalid API Key' }, status: :unauthorized
    end
  end
end
