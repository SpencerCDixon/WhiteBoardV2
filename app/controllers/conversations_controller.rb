class ConversationsController < ApplicationController
  def index
    @convos = current_user.conversations
  end

  def show
    @convo = Conversation.find(params[:id])
  end

  def create
    builder = ConversationBuilder.new(conversation_params, current_user)
    if builder.send_message
      flash[:notice] = "Successfully sent message"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to :back
  end

  private

  def conversation_params
    params.require(:conversation).permit(:to, :body, :subject)
  end
end
