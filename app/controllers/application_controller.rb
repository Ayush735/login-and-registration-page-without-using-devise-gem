class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def authenticate_user
    unless session[:user_id]
      redirect_to new_session_path, alert: "invalid access found.. please authorize through login"
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id] 
      return true
    end
  end
end