class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :outstanding_requests_renter, if: :user_signed_in?

  private

  def outstanding_requests_renter
    @out_req_renter = Booking.joins(:digger).where(diggers: { user_id: current_user.id }, bookings: { approved: nil })
  end
end
