class WelcomeController < ApplicationController
  def index

    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end
  end
end
