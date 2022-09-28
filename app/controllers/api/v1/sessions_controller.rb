class Api::V1::SessionsController < ApplicationController
  include ParamsHelper

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Email or password is invalid. Please try again." }, status: 401
    end
  end
end
