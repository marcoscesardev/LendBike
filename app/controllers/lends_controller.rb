class LendsController < CrudController
  before_action :load_collections, only: [:new, :create, :edit, :update]

  private

  def load_collections
    @bikes = Bike.all.active.available
    @users = User.all.active
    @stations = Station.all.active
  end

  protected

  def object_params
    params.require(:lend).
      permit(
        :bike_id,
        :user_id,
        :origin_id,
        :destiny_id,
        :distance,
        :start_at,
        :end_at
      )
  end
end
