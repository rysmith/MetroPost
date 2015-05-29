class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  #create a user object from the incoming form (users#new)
  def create

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
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
