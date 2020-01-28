class CrudController < ApplicationController
  inherit_resources

  def index
    build_resource

    respond_to do |format|
      format.html { render :index }
    end
  end

  def create
    @object = resource_class.new(object_params)

    if @object.save
      flash[:notice] = I18n.t(
        'messages.object_successfully_created',
        object_name: resource_class.model_name.human
      )

      redirect_to resource_path(@object)
    else
      flash[:alert] = @object.errors if @object.errors.present?

      render :new
    end
  end

  def update
    @object = resource_class.find(params[:id])

    if @object.update(object_params)
      flash[:notice] = I18n.t(
        'messages.object_successfully_updated',
        object_name: resource_class.model_name.human
      )

      redirect_to resource_path(@object)
    else
      flash[:alert] = @object.errors if @object.errors.present?

      render :edit
    end
  end

  protected

  def build_resource
    resource_class.new
  end
end
