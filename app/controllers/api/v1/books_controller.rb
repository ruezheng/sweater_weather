class Api::V1::BooksController < ApplicationController

  def search
    location = params[:location]
    BooksSerializer.format_books(location)
  end
end