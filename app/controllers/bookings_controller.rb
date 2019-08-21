class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @digger = Digger.find(params[:digger_id])
    @booking.digger = @digger
    @user = current_user
    @booking.user = @user
    @booking.errors.add(:start_date, "| digger not available") if !@booking.start_date.between?(@digger.start_date, @digger.end_date)
    @booking.errors.add(:end_date, "| digger not available") if !@booking.end_date.between?(@digger.start_date, @digger.end_date)
    if @booking.errors.any?
      render "diggers/show"
    else
      @booking.save
      redirect_to root_path, notice: 'Booking request has been sent'
    end
  end

  def made
    @bookings = Booking.where(params[:user_id] == current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
