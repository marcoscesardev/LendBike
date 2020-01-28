class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :lend, -> { active }, class_name: 'Lend'
  
  has_many :lends

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
end
