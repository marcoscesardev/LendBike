class BikesController < CrudController
  protected

  def object_params
    params.require(:bike).permit(:situation, :code, :active)
  end
end
