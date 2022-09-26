class Api::V1::BooksController < ApplicationController

  def search
    location = MapquestFacade.create_coordinates(params[:location])
    forecast = OpenweatherFacade.create_forecast(location)
    books = OpenlibraryFacade.create_books(location)

    BooksSerializer.format_books(location, forecast, books)
  end
end