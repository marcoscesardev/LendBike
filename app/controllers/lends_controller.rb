class LendsController < CrudController
  before_action :load_collections, only: [:new, :create, :edit, :update]

  private

  def load_collections
    @bikes = Bike.active.where.not(id: Bike.active_lend).to_a
    @users = User.active.to_a
    @stations = Station.active.to_a

    # Ensures to bring items that were already registered
    if action_name != 'new'
      @bikes = @bikes.push(resource&.bike).uniq.compact
      @users = @users.push(resource&.user).uniq.compact
      @stations = @stations.push(resource&.station).uniq.compact
    end
  end

  protected

  def object_params
    params.require(:lend).
      permit(
        :bike_id,
        :user_id,
        :station_id,
        :distance,
        :start_at,
        :end_at
      )
  end
end
