class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @digger = Digger.find(params[:digger_id])
    @booking.digger = @digger
    @user = current_user
    @booking.user = @user
    authorize @booking
    @booking.errors.add(:start_date, "| digger not available") if !@booking.start_date.between?(@digger.start_date, @digger.end_date)
    @booking.errors.add(:end_date, "| digger not available") if !@booking.end_date.between?(@digger.start_date, @digger.end_date)
    if @booking.errors.any?
      render "diggers/show"
    else
      @booking.save
      redirect_to root_path, notice: 'Booking request has been sent'
    end
  end

  def index
    bookings = policy_scope(Booking)
    @bookings = bookings.where(digger_id: params[:digger_id].to_i)
    @approved = @bookings.where(approved: true)
    @rejected = @bookings.where(approved: false)
    @awaiting = @bookings.where(approved: nil)
    render "bookings/received"
  end

  def mine
    # @bookings = Bookingsjoins(:digger).where(diggers: { user_id: user })
    @bookings = Booking.where(user_id: current_user.id)
    authorize @bookings
    @approved = @bookings.where(approved: true)
    @rejected = @bookings.where(approved: false)
    @awaiting = @bookings.where(approved: nil)
  end

  def received
    @bookings = policy_scope(Booking)
    #@bookings = @bookings.order("approved DESC")
    @approved = @bookings.where(approved: true)
    @rejected = @bookings.where(approved: false)
    @awaiting = @bookings.where(approved: nil)

    authorize @bookings
  end

  def approval
    @booking = Booking.find(params[:id])
    authorize @booking
    ActiveRecord::Type::Boolean.new.cast(params[:boolean]) ? @booking.approved = true : @booking.approved = false
    @booking.save
    redirect_to bookings_received_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
