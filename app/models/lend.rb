class Lend < ApplicationRecord
  default_scope { order(:start_at) }

  belongs_to :station
  belongs_to :bike
  belongs_to :user

  validates :bike, :user, :start_at, presence: true
  validates :distance, numericality: { greater_than: 0 }
  validates :distance, :end_at, :station, presence: true, if: -> { distance || end_at || station }
  validate :bike_available, :user_without_active_lend, :valid_date, :destination_other_than_origin
  
  scope :active, -> { where(end_at: nil) }
  scope :from_bike, -> bike { where(bike_id: bike) }
  scope :with_id_less_than, -> id { where("id < ?", id) }

  def last_lend
    Lend.from_bike(bike).with_id_less_than(id).limit(2)&.first
  end

  private

  def bike_available
    if bike.lend.present? || bike.maintenance || !bike.active
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.bike_unavailable'))

      false
    else
      true
    end
  end

  def user_without_active_lend
    if user.lend.present? || !user.active
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.user_cant_lend'))

      false
    else
      true
    end
  end

  def valid_date
    if end_at.present? && end_at <= start_at
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.invalid_date'))

      false
    else
      true
    end
  end

  def destination_other_than_origin
    if last_lend&.station == station
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.invalid_destination'))

      false
    else
      true
    end
  end
end
