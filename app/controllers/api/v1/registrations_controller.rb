class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(user_paramssignup)

    if user.save

      json_response(user.as_json(auth_token: user.authentication_token, email: user.email), 201)

      return

    else

      warden.custom_failure!

      json_response(user.errors, 422)

    end
  end

  private

  def user_paramssignup
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
