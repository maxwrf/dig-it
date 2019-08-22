class ChannelsController < ApplicationController
    def index
    @channels = policy_scope(Channel)
  end

  def show
    @channel = Channel.includes(letters: :user).find(params[:id])
    authorize @channel
  end

  def create
    @channel = Channel.new(channel_params)
    authorize @channel
    if @channel.save!
      redirect_to channel_path(@channel)
    else
      render :index
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name, :photo)
  end
end
