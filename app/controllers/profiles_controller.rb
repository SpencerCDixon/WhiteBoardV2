class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(slug: params[:id])
  end
end
