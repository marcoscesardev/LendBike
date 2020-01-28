class Api::V1::BikeResource < JSONAPI::Resource
  attributes :code, :maintenance, :active
end
