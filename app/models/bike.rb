class Bike < ApplicationRecord
  has_one :lend, -> { active }, class_name: 'Lend'
  
  has_many :lends

  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true

  scope :active, -> { where(active: true) }

  def to_s
    code
  end
end
