class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :digger
  validate :end_after_start

  def end_after_start
    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
