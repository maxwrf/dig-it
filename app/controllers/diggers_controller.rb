class DiggersController < ApplicationController
  def new
  @digger = Digger.new
  end

  def create
    @digger = Digger.new(digger_params)
    @user = current_user
    @digger.user = @user
    if @digger.save
      redirect_to digger_path(@digger)
    else
      render :new
    end
  end

  def edit
    @digger = Digger.find(params[:id])
  end

  def update
    @digger = Digger.find(params[:id])
    if @digger.update(digger_params)
      redirect_to digger_path(@digger)
    else
      render :edit
    end
  end

  def index
    if params[:start_date] && params[:end_date]
      start_date = Date.civil(params[:start_date][:year].to_i,
                              params[:start_date][:month].to_i,
                              params[:start_date][:day].to_i)
      end_date = Date.civil(params[:end_date][:year].to_i,
                            params[:end_date][:month].to_i,
                            params[:end_date][:day].to_i)
      if dates_validate?(start_date, end_date)
        @diggers = Digger.where("start_date <= :sd AND end_date >= :ed",
                                sd: start_date, ed: end_date)
      end
    elsif params[:search]
      @diggers = Digger.search(params[:search])
    else
      render "pages/home"
    end
  end

  def search
  end

  def show
    @digger = Digger.find(params[:id])
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
