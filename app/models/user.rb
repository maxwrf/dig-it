class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :diggers
  has_many :bookings, through: :diggers
  has_many :messages, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def full_name
    first_name.nil? && last_name.nil? ? "Anonymous" : "#{first_name} #{last_name}"
  end
end
