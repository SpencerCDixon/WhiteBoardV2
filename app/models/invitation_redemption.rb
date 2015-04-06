class InvitationRedemption
  def initialize(user, invitation)
    @user = user
    if invitation.class.to_s == 'FamilyInvitation'
      @invitation = invitation
    else
      @invitation = FamilyInvitation.unredeemed.find_by(token: invitation)
    end
  end

  def persist!
    binding.pry
    @invitation.user = @user
    @invitation.save!

    @invitation.family.family_memberships.find_or_initialize_by(user: @user).save!
  end
end
