class SessionsController < Devise::SessionsController
  before_action :devise_params, only: [:edit, :create, :update]
  layout :layout_name

  def layout_name
    return 'application' if action_name.in?(%w(edit update))

    'auth'
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
