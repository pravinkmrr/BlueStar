class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def current_user
      unless session[:user_id]
          flash[:notice] = "Please login to continue"
          redirect_to(new_session_path)
      end
  end


  helper_method :current_user
end
