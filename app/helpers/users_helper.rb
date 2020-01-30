module UsersHelper
  def list_attributes_show
    %w(id email name is_admin active created_at updated_at)
  end

  def list_attributes(_object)
    list_attributes_show
  end
end
