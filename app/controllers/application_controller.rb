class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #exposes our current_user method to the rest of the application
  helper_method :current_user

  protected

  #this only works if there is a session id (ie if the user has been logged in)
  #this is a singleton, if it happened once it wont do it again
  #this is a helper method that is globally available to any controller or view
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
