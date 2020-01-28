class SessionsController < Devise::SessionsController
  before_action :devise_params, only: [:edit, :create, :update]
  layout :layout_name

  def layout_name
    return 'application' if action_name.in?(%w[edit update])

    'auth'
  end

  def create
    unless current_user&.is_admin
      flash[:alert] = I18n.t('devise.failure.login_only_for_admin')
      render :new

      return
    end

    super
  end

  private

  def devise_params
    params.require(:user).
      permit(
        :name,
        :email,
        :password,
        :active,
        :is_admin
      )
  end
end