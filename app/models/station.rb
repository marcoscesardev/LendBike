class Station < ApplicationRecord
  has_many :lends
  has_many :lends_current, -> { current }, class_name: 'Lend'

  validates :vacancies, :code, :address, :name, presence: true
  validates :code, length: { maximum: 15 }, uniqueness: true
  validates :vacancies, numericality: { greater_than: 0 }
  validate :check_vancacies

  scope :active, -> { where(active: true) }

  def to_s
    name
  end

  def check_vancacies
    if vacancies < lends_current.size
      errors.add(
        :base,
        I18n.t('activerecord.messages.station.error.invalid_vacancies', amount: lends_current.size)
      )

      false
    else
      true
    end
  end
end
