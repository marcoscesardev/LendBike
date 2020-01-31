class UsersController < CrudController
  protected

  def object_params
    params['user'].reject! { |key, value| key == 'password' && value.blank? }

    params.require(:user).permit(:name, :email, :password, :is_admin, :active)
  end
end
