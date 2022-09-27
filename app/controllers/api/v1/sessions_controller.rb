class SessionsController < ApplicationController
  include ParamsHelper

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: user.errors.full_messages.to_sentence, status: 400
    end
  end
end
