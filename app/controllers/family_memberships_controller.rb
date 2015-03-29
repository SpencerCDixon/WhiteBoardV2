class FamilyMembershipsController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
    @members = @family.users
  end
end
