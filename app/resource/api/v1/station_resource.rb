class Api::V1::StationResource < JSONAPI::Resource
  attributes :code, :name, :address, :vacancies, :active
end
