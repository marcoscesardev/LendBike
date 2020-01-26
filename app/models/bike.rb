class Bike < ApplicationRecord
  enum situation: [:available, :in_use, :maintenance]
  
  translate_enum :situation

  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
end
