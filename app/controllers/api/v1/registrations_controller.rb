class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(user_paramssignup)

    if user.save
      render json:{ token: user.authentication_token, status: 201 }
      #json_response(user.authentication_token, 201)
      return
    else
      warden.custom_failure!
      if user.errors[:email].first == "has already been taken"
        render json:{ token: nil, status: 423 }
      elsif user.errors[:email].first == "is invalid"
        render json:{ token: nil, status: 422 }
      elsif user.errors[:password].first == "is too short (minimum is 6 characters)"
        render json:{ token: nil, status: 425 }
      elsif user.errors[:password_confirmation].first == "doesn't match Password"
        render json:{ token: nil, status: 424 }
      else
        render json:{ error: user.errors }
      end
      #json_response(user.errors, 422)
    end
  end

  private

  def user_paramssignup
    #params.require(:user).permit(:email, :password, :password_confirmation)
    params.permit(:email, :password, :password_confirmation)
  end
end
