class Api::V1::Controller < ActionController::Base
  include JSONAPI::ActsAsResourceController
  respond_to :json
  
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request!, unless: :validate_request?

  protected

  def encode(payload)
    payload[:exp] = 7.days.from_now.to_i

    JWT.encode(payload, ENV['SECRET_KEY_BASE'])
  end

  def decode(token)
    HashWithIndifferentAccess.new(JWT.decode(token, ENV['SECRET_KEY_BASE'])[0])
  rescue
    nil
  end

  def valid_payload?(payload)
    Time.at(payload['exp'].to_i) < Time.now
  end

  def authenticate_request!
    if user_id_in_token? && !valid_payload?(auth_token)
      @current_user = User.find(auth_token[:user_id])
    else
      render json: {
        errors: [{
          message: I18n.t('api.errors.messages.not_authenticated'),
          status: 401,
        }],
      }, status: :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: {
      errors: [{
        message: I18n.t('api.errors.messages.not_authenticated'),
        status: 401,
      }],
    }, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  def validate_request?
    request.headers['REQUEST_METHOD'] == "POST" &&
      request.headers['CONTENT_TYPE'] == "application/json" &&
      request.headers['REQUEST_URI'] == "/api/v1/auth/token"
  end
end
