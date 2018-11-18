class Api::V1::SessionsController < Devise::SessionsController
  include ActionController::Helpers
  include ActionController::Flash
  include ActionController::MimeResponds
  prepend_before_action :require_no_authentication, only: :create
  before_action :ensure_params_exist, only: :create

  respond_to :json

  def create
    user = User.find_by(email: params[:email])
    unless user.nil?
      if user.valid_password? params[:password]
        json_response(user, 302)
        return
      end
    end
    json_response('{"error": "invalid email and password combination"}' , 422)
  end

  def destroy
    sign_out_and_redirect(current_user)
  end

  protected

  def ensure_params_exist
    return unless params[:email].blank?

    json_response('{"error": "missing user_email parameter"}', 422)
  end

  def invalid_login_attempt
    warden.custom_failure!
    json_response('{"error": "error with login or password"}', 401)
  end
end
