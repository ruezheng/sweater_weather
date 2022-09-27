module ParamsHelper

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end