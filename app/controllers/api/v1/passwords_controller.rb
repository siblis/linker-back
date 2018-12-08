class Api::V1::PasswordsController < Devise::PasswordsController
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  def change
    if current_user && current_user.valid_password?(params[:current_password]) && current_user.reset_password(params[:new_password_1], params[:new_password_2])
      render status: 200
    else
      render status: 422
    end
  end

  private

  def current_user
    User.find_by(authentication_token: params[:user_token])
  end
end
