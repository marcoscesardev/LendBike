class Bike < ApplicationRecord
  has_one :lend, -> { active }, class_name: 'Lend'

  has_many :lends

  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
  validate :check_lend_active

  scope :active, -> { where(active: true) }
  scope :not_in_maintenance, -> { where(maintenance: false) }
  scope :active_lend, -> { joins(:lends).where("lends.station_id IS NULL") }

  def to_s
    code
  end

  private

  def check_lend_active
    if lend.present?
      errors.add(:base, I18n.t('activerecord.messages.bike.error.lend_active'))

      false
    else
      true
    end
  end
end
