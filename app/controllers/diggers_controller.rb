class DiggersController < ApplicationController
  def new
  @digger = Digger.new
  end

  def create
    @digger = Digger.new(digger_params)
    @user = current_user
    @digger.user = @user
    if @digger.save
      redirect_to diggers_path
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
      redirect_to diggers_path
    else
      render :edit
    end
  end

  private

  def digger_params
    params.require(:digger).permit(:name, :technical_specification, :start_date,
    :end_date, :photo, :day_rate)
  end
end
