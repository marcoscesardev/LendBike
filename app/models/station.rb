class Station < ApplicationRecord
  has_many :lends

  validates :vacancies, :code, :address, :name, presence: true
  validates :code, length: { maximum: 15 }, uniqueness: true
  validates :vacancies, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
end
