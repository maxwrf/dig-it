class Digger < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :technical_specification, presence: true
  validates :day_rate, numericality: true, presence: true
  validate :end_after_start
  validates :start_date, :end_date, :presence => true

  private
  def end_after_start
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
