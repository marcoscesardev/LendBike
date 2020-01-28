class Lend < ApplicationRecord
  default_scope { order(:start_at) }

  belongs_to :station
  belongs_to :bike
  belongs_to :user

  scope :active, -> { where(end_at: nil) }
  scope :desc, -> { order(start_at: :asc) }
  
  validate :bike_bike_available

  def bike_available
    if bike.lend.present? || bike.maintenance
      #error
    end 
  end
end
