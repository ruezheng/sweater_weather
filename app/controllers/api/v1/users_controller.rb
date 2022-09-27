class Api::V1::UsersController < ApplicationController
  include ParamsHelper
  
  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      user.errors.full_messages.to_sentence.to_s
      render status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
