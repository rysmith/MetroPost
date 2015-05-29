class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  #create a user object from the incoming form (users#new)
  def create

    if User.create user_params

      flash[:success] = 'you have been registered'
      redirect_to users_path
    else
      flash[:error] = 'unable to sign you in'
      render :new
    end

  end

  private

  def user_params
    #white listing only the fields you want.  Always use params.require and dont assign incoming data right to your model
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
