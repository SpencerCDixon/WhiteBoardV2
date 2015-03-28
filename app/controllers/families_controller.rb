class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    if FamilyBuilder.new(family_params, current_user).build
      flash[:info] = "Successfully created family."
    else
      flash[:alert] = "You're already in a family!"
    end
    redirect_to profile_path(current_user.profile)
  end

  private

  def family_params
    params.require(:family).permit(:name)
  end
end
