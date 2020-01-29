class Lend < ApplicationRecord
  before_commit :change_current_lend

  belongs_to :station, optional: true
  belongs_to :bike
  belongs_to :user

  validates :bike_id, :user_id, :start_at, presence: true
  validates :distance, numericality: { greater_than: 0 }, if: -> { distance || end_at || station }
  validates :distance, :end_at, :station_id, presence: true, if: -> { distance || end_at || station }
  validate :bike_available, :user_without_active_lend, :valid_date, :destination_other_than_origin,
           :available_vacancies

  scope :current, -> { where("station_id IS NOT NULL AND current IS TRUE") }
  scope :active, -> { where(end_at: nil) }
  scope :from_bike, -> bike { where(bike_id: bike) }
  scope :with_id_less_than, -> id { where("id < ?", id) }

  def last_lends
    Lend.from_bike(bike).with_id_less_than(id).last
  end

  private

  def available_vacancies
    if station.present? && station.lends_current.ids.push(id).uniq.size > station.vacancies
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.unavailable_vacancies'))

      false
    else
      true
    end
  end

  def change_current_lend
    last_lends&.update_attribute(:current, false) if station.present?
  end

  def bike_available
    if (bike&.lend.present? && bike&.lend&.id != id) || bike&.maintenance || !bike&.active
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.bike_unavailable'))

      false
    else
      true
    end
  end

  def user_without_active_lend
    if (bike&.lend.present? && bike&.lend&.id != id) || !user&.active
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
    if station && last_lends&.station == station
      errors.add(:base, I18n.t('activerecord.errors.models.lend.messages.invalid_destination'))

      false
    else
      true
    end
  end
end
