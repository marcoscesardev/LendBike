class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  scope :active, -> { where(active: true) }

  def to_s
    name
  end
end
