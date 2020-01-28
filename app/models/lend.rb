class Lend < ApplicationRecord
  belongs_to :origin, class_name: 'Station'
  belongs_to :destiny, class_name: 'Station'
  belongs_to :bike
  belongs_to :user
end
