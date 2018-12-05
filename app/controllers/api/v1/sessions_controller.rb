class Api::V1::SessionsController < Devise::SessionsController
  include ActionController::Helpers
  include ActionController::Flash
  include ActionController::MimeResponds
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  prepend_before_action :require_no_authentication, only: :create
  before_action :ensure_params_exist, only: :create
  skip_before_action :verify_signed_out_user
  respond_to :json
  def create
    user = User.find_by(email: params[:email])
    unless user.nil?
      if user.valid_password? params[:password]
        # json_response(user, 302)
        render json: { token: user.authentication_token, status: 302 }
        return
      end
    end
    # json_response('{"error": "invalid email and password combination"}' , 422)
    render json: { token: nil, status: 422 }
  end

  def destroy
    user = User.find_by(authentication_token: params[:user_token])
    if user.nil?
      render status: 404, json: { message: 'Invalid token.' }
    else
      user.reset_authentication_token!
      render status: 204, json: nil
    end
    super
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

  private

  def current_user
    authenticate_with_http_token do |token, options|
      User.find_by(authnettication_token: token)
    end
  end
end
