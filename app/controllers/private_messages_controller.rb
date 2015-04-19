class PrivateMessagesController < ApplicationController
  def create
    @convo = Conversation.find(params[:conversation_id])
    @message = current_user.private_messages.new(message_params)
    @message.conversation = @convo

    if @message.save
      flash[:notice] = 'Successfully replied'
    else
      flash[:alert] = 'Something went wrong'
    end

    redirect_to conversation_path(@convo)
  end

  private

  def message_params
    params.require(:private_message).permit(:body)
  end
end
