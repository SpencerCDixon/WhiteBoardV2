class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = Profile.find_by(slug: params[:id])
  end
end
