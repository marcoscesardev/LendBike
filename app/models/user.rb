class User < ApplicationRecord
  devise :custom_authenticatable, :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable

  has_one :lend, -> { active }, class_name: 'Lend'

  has_many :lends

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
  
  def valid_for_custom_authentication?(password)
    self.is_admin
  end
end
