class FamilyMessagesController < ApplicationController
  before_action :fetch_family, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @finder = MessageFinder.new(params[:q], @family)
    @general = @finder.general
    @events = @finder.event
    @chores = @finder.chore
    @sharables = @finder.sharable
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
    params.require(:family_message).permit(:message, :category)
  end
end
