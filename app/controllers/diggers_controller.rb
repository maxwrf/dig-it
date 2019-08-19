class DiggersController < ApplicationController
  def index
    if params[:start_date]
      start_date = Date.civil(params[:start_date][:year].to_i,
                 params[:start_date][:month].to_i,
                 params[:start_date][:day].to_i)
      end_date = Date.civil(params[:end_date][:year].to_i,
                 params[:end_date][:month].to_i,
                 params[:end_date][:day].to_i)
      @diggers = Digger.where("start_date <= :sd AND end_date >= :ed",
                              sd: start_date, ed: end_date)
    elsif params[:search]
      @diggers = Digger.search(params[:search])
    else
      @diggers = Digger.all
    end
  end

  def search
  end

  def show
    @digger = Digger.find(params[:id])
  end
end
