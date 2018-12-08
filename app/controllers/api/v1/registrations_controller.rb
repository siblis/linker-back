class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(user_paramssignup)

    if user.save
      render json: { token: user.authentication_token, status: 201 }
      return
    else
      warden.custom_failure!
      render json: { token: nil, status: user.errors.values.flatten.first.to_i }
    end
  end

  private

  def user_paramssignup
    params.permit(:email, :password, :password_confirmation)
  end
end
