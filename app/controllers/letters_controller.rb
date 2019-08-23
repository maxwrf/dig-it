class LettersController < ApplicationController
  before_action :flag_other
    def create
    @letter = Letter.new(letter_params)
    @channel = Channel.find(params[:channel_id])
    @letter.channel = @channel
    @letter.user = current_user
    authorize @letter
    if @letter.save!
      respond_to do |format|
        format.html { redirect_to channels_path(@channel) }
        format.js
      end
    else
      respond_to do |format|
      format.html { render "channels/show" }
      format.js
      end
    end
  end

  private

  def letter_params
    params.require(:letter).permit(:body)
  end

  def flag_other
    @other = true
  end
end
