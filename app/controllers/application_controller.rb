class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  # define require_sign_in to redirect un-signed-in users, defined here bc we want to call it from other controllers
  # all controllers inherit from the ApplicationController class
  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      # #11
      redirect_to new_session_path
    end
  end
end
