class ApplicationController < ActionController::Base
  before_action :devise_permitted_paramters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user! -- Need to figure out which actions
  # require authentication and which dont need it.

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  protected

  def devise_permitted_paramters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  # redirects to users profile path after sign in/sign up
  def after_sign_in_path_for(resource)
    profile_path(resource.profile)
  end

  def after_sign_up_path_for(resource)
    profile_path(resource.profile)
  end
end
