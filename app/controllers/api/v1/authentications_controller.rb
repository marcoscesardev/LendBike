class Api::V1::AuthenticationsController < Api::V1::Controller
  def authenticate_user
    user = User.find_by(email: params[:email])

    if user.present? && user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {
        errors: [{
          message: I18n.t('api.errors.messages.invalid_email_or_password'),
          status: 401,
        }],
      }, status: :unauthorized
    end
  end

  private

  def payload(user)
    {
      token: encode(
        { user_id: user.id, iat: DateTime.current.to_i }
      ),
      user: {
        id: user.id,
      },
    }
  end
end
