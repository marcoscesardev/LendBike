class BikesController < CrudController
  before_action :load_bike_situations, only: [:new, :create, :edit, :update]
  
  private

  def load_bike_situations
    @bike_situations = Bike.translated_situations.reject{|a| a.include?('in_use') }
  end

  protected

  def object_params
    params.require(:bike).permit(:situation, :code, :active)
  end
end
