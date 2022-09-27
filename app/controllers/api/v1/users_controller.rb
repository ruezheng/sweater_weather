class Api::V1::UsersController < ApplicationController
  include ParamsHelper
  
  def create
    user = User.new(user_params)
    
    if user.save
      api_key = user.generate_api_key
      render json: UserSerializer.new(user), status: :created
    else
      render json: user.errors.full_messages.to_sentence, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
