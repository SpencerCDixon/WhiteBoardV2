class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(slug: params[:id])
    @message = FamilyMessage.new

    if current_user.has_family?
      @messages = current_user.family.family_messages
    end
  end
end
