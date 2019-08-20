class DiggersController < ApplicationController
  def show
    @digger = Digger.find(params[:id])
    @booking = Booking.new
  end
end
