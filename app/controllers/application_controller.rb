class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_user

  # if user logs in successfully, return @current_user which will be available throughout the application
  def current_user
  	if session[:user_id]
  		@current_user ||= User.find(session[:user_id])
  		return @current_user
  	else
  		return nil
  	end
  end

  def require_user
  	redirect_to new_user_path unless current_user
  end

end
