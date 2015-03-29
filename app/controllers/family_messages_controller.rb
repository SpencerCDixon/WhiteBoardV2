class FamilyMessagesController < ApplicationController

  def create
    family = Family.find(params[:family_id])
    message = current_user.family_messages.new(family_message_params)
    message.family = family

    if message.save
      flash[:info] = "Successfully created message"
    else
      flash[:alert] = "Message wasn't saved"
    end
    redirect_to profile_path(current_user.profile)
  end

  private

  def family_message_params
    params.require(:family_message).permit(:message)
  end
end
