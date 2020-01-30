class Api::V1::BikeResource < JSONAPI::Resource
  attributes :code, :maintenance, :active, :lend_active

  def lend_active
    @model.lend&.attributes || false
  end
end
