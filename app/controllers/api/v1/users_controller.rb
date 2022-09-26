class Api::V1::UsersController < ApplicationController

  def create
    # if User.save
    #   status: 201
    # else
    #   render json: { error: 'Password and password confirmation does not match. Please try again.' }, status: 404
    #   render json: { error: 'Email has already been taken. Please enter another email.' }, status: 404
    #   render json: { error: 'Missing field. Please complete all fields.' }, status: 404
    # end
  end
end