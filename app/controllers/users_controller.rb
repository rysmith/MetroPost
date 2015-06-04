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
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id.to_s
      flash['alert-success'] = "You have been registered #{@user.username}, please login."
      redirect_to new_session_path
    else
      flash['alert-warning'] = 'Unable to create a user account.'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    #white listing only the fields you want.  Always use params.require and dont assign incoming data right to your model
    #see explanation of the require/permit combo in sessions_controller.rb
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
