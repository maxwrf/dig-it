class DiggersController < ApplicationController
  def new
    @digger = Digger.new
    authorize @digger
  end

  def create
    @digger = Digger.new(digger_params)
    @user = current_user
    @digger.user = @user
    authorize @digger
    if @digger.save
      redirect_to digger_path(@digger)
    else
      render :new
    end
  end

  def edit
    @digger = Digger.find(params[:id])
    authorize @digger
  end

  def update
    @digger = Digger.find(params[:id])
    authorize @digger
    if @digger.update(digger_params)
      redirect_to digger_path(@digger)
    else
      render :edit
    end
  end

  def index
    diggers = policy_scope(Digger)
    if params[:start_date] && params[:end_date]
      start_date = Date.civil(params[:start_date][:year].to_i,
                              params[:start_date][:month].to_i,
                              params[:start_date][:day].to_i)
      end_date = Date.civil(params[:end_date][:year].to_i,
                            params[:end_date][:month].to_i,
                            params[:end_date][:day].to_i)
      if dates_validate?(start_date, end_date)
        @diggers = diggers.select do |digger|
          start_date <= digger.start_date && end_date >= digger.end_date
        end
      end
    elsif params[:search]
      @diggers = diggers.select do |digger|
        digger.name.downcase.match?(/.*#{params[:search].downcase}.*/) || digger.technical_specification.downcase.match?(/.*#{params[:search].downcase}.*/)
      end
    else
      render "pages/home"
    end
  end

  def search
    authorize Digger
  end

  def show
    @digger = Digger.find(params[:id])
    @booking = Booking.new
    authorize @digger
    @conversations = Conversation.all
  end

  def destroy
    @digger = Digger.find(params[:id])
    authorize @digger
    if @digger.bookings.length.positive?
      redirect_to digger_path(@digger), notice: "For this digger bookings exist"
    else
      @digger.destroy
      redirect_to root_path, notice: "Digger has been deleted"
    end
  end

  def mine
    @diggers = current_user.diggers
    authorize @diggers
    render 'index'
  end

  private

  def digger_params
    params.require(:digger).permit(:name, :technical_specification, :start_date,
                                   :end_date, :photo, :day_rate)
  end

  def dates_validate?(start, end_d)
    true if start <= end_d
  end
end
