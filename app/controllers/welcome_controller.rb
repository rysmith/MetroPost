class WelcomeController < ApplicationController
  def index
    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end
  end
end
