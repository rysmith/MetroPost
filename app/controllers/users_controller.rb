class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    if User.create user_params
      flash[:success] = "you have been registered"
      redirect_to users_path
    else
      flash[:error] = "unable to sign you in 8["
      #what is this rendering?  I cant find a alias symbol :new
      render :new
    end
  end
end
