class Digger < ApplicationRecord
  belongs_to :user
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  def self.search(search)
    where("name ILIKE ? OR technical_specification ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
