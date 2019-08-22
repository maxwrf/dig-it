class ConversationsController < ApplicationController
  # def index
  #   conversations = policy_scope(Conversation)
  #   @users = User.all
  #   @conversation = Conversation.all
  #   authorize @conversation
  # end

  # def create
  #   @conversation = Conversation.new
  #   authorize @conversation
  #   if Conversation.between(params[:sender_id], params[:recipient_id]).present?
  #     @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  #   else
  #     @conversation = Conversation.create!(conversation_params)
  #   end
  #   redirect_to conversation_messages_path(@conversation)
  # end

  # private

  # def conversation_params
  #   params.permit(:sender_id, :recipient_id)
  # end
  def index
    @conversations = policy_scope(Conversation)
  end

  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
    authorize @conversation
  end

  def create
    @conversation = Conversation.new(conv_params)
    authorize @conversation
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render :index
    end
  end

  private

  def conv_params
    params.require(:conversation).permit(:name)
  end
end
