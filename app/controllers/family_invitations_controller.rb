class FamilyInvitationsController < ApplicationController
  def show
    @family_invitation = FamilyInvitation.unredeemed.find_by!(token: params[:id])
    if current_user
      InvitationRedemption.new(current_user, @family_invitation).persist!
      redirect_to profile_path(current_user.profile)
    else
      session[:invitation_token] = @family_invitation.token
      redirect_to new_user_registration_path
    end
  end

  def create
    invitation = FamilyInvitation.new(invite_params)
    invitation.family = current_user.family

    if invitation.send_invite
      flash[:info] = "Successfully sent invitation"
      redirect_to profile_path(current_user.profile)
    else
      redirect_to :back,
        alert: "#{invitation.errors.full_messages.join(',')}"
    end
  end

  private

  def invite_params
    params.require(:family_invitation).permit(:email, :name)
  end
end
