class Digger < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :technical_specification, presence: true
  validates :day_rate, numericality: true, presence: true
end
