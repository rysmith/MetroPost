class UsersController < ApplicationController

  def index

  end

  #create a new User object and pass it to the create method
  def new
    @user = User.new
  end

  #create a user object from the incoming form (users#new)
  def create

    #.create is a method we get from AR.
    #it returns a new object in local memory with the specified params
    #it then saves the hash object in the database.
    if User.create user_params

      flash[:success] = 'You have been registered, please login.'
      redirect_to new_session_path
    else
      flash[:error] = 'Unable to create a user account.'
      redirect_to new_user
    end
  end

  private

  def user_params
    #white listing only the fields you want.  Always use params.require and dont assign incoming data right to your model
    #see explanation of the require/permit combo in sessions_controller.rb
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
