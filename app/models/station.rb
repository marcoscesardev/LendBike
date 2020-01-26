class Station < ApplicationRecord
  validates :vacancies, :code, :address, :name, presence: true

  validates :code, length: { maximum: 10 }, uniqueness: true
  validates :vacancies,  numericality: { greater_than: 0 }
end
