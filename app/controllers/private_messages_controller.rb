class PrivateMessagesController < ApplicationController
  def create
    recipient = User.find(user_id)
    current_user.send_message(recipient, *message_params)
    flash[:notice] = "Mesage sent"
    redirect_to :back
  end

  private

  def user_id
    params["message"]["recipient_id"]
  end

  def message_params
    p = params.require(:message).permit(:body, :subject)
    [p["body"], p["subject"]]
  end
end
