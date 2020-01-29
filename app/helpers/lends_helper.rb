module LendsHelper
  def edit_link(object)
    link_to raw('<i class="material-icons">transfer_within_a_station</i>'), edit_resource_path(object)
  end
end
