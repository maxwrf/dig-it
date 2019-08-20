class Digger < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :technical_specification, presence: true
  validates :day_rate, numericality: true, presence: true
  validate :end_after_start
  validates :start_date, :end_date, presence: true

  mount_uploader :photo, PhotoUploader

  def self.search(search)
    where("name ILIKE ? OR technical_specification ILIKE ?", "%#{search}%", "%#{search}%")
  end

  private

  def end_after_start
    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
