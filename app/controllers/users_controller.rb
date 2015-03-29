class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :finish_signup]
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  def edit
  end

  def update
    if @user.update(user_params)
      sign_in(@user == current_user ? @user : current_user, bypass: true)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  def finish_signup
    if request.patch? && params[:user] && params[:user][:email]
      if @user.update(user_params)
        # reset profile slug
        @user.profile.set_slug
        @user.profile.save

        sign_in(@user, bypass: true)
        redirect_to root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
        @user.errors.messages[:account] = ["might be created with a different provider"]
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email ] # can extend with extra user params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
