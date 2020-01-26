class StationsController < CrudController
  protected

  def object_params
    params.require(:station).permit(:name, :code, :address, :active, :vacancies)
  end
end
