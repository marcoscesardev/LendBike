class Api::V1::LendResource < JSONAPI::Resource
  attributes :code, :name, :address, :vacancies, :active, :occupied_vacancies, :bikes
  
  def occupied_vacancies
    @model.lends_current.size
  end

  def bikes
    @model.lends_current.map{ |a| a.bike.attributes.dup }
  end
end
