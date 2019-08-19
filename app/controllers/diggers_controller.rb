class DiggersController < ApplicationController
  def index
    @diggers = Digger.all
    @diggers = Digger.search(params[:search]) if params[:search]
  end

  def search
  end

  def show
    @digger = Digger.find(params[:id])
  end
end
