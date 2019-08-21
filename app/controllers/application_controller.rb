class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :no_of_approved_bookings, if: :user_signed_in?
  before_action :outstanding_requests_renter, if: :user_signed_in?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def outstanding_requests_renter
    @out_req_renter = Booking.joins(:digger).where(diggers: { user_id: current_user.id }, bookings: { approved: nil })
  end

  def no_of_approved_bookings
    @approved_bookings = Booking.where(:approved => [true, false]).where(:user_id => current_user.id).count
  end
end
