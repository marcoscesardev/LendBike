class Bike < ApplicationRecord
  has_one :lend, -> { desc }, class_name: 'Lend'
  has_many :lends

  enum situation: { :available => 0, :in_use => 1, :maintenance => 2 }

  translate_enum :situation

  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :available, -> { where(situation: 1) }

  def to_s
    code
  end
end
