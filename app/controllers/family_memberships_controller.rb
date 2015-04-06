class FamilyMembershipsController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
    @members = @family.users
    @invitation = FamilyInvitation.new
  end
end
