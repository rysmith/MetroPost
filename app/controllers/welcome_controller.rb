class WelcomeController < ApplicationController
  def index

    #current_user is a helper method in the application controller
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end
  end
end
