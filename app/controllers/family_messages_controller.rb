class FamilyMessagesController < ApplicationController
  before_action :fetch_family, only: [:index, :create]

  def index
    @general = @family.general_messages
    @events = @family.event_messages
    @chores = @family.chore_messages
    @sharables = @family.sharable_messages
  end

  def create
    message = current_user.family_messages.new(family_message_params)
    message.family = @family

    if message.save
      flash[:info] = "Successfully created message"
    else
      flash[:alert] = "Message wasn't saved"
    end
    redirect_to family_family_messages_path(@family)
  end

  private

  def fetch_family
    @family = Family.find(params[:family_id])
  end

  def family_message_params
    params.require(:family_message).permit(:message, :message_category_id)
  end
end
