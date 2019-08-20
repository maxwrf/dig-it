class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @digger = Digger.find(params[:digger_id])
    @booking.digger = @digger
    @user = current_user.id
    @booking.user_id = @user
    if @booking.save
      redirect_to root_path, notice: 'Booking request has been sent'
    else
      redirect_to digger_path(@digger), notice: 'Please select a valid date'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
