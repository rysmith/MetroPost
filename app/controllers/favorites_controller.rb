class FavoritesController < ApplicationController


  def index

    #in the index view we are only showing the current_user's favorites
    @favorites = Userline.all

    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end

  end


  def new

    #send over a new favorite object for the user to fill in
    @favorite = Userline.new

    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end

  end

  def create

    #recieve the favorite object back from the view
    user_line = Userline.new(params.require(:userline).permit(:line_id, :user_id))

    #auto update the user_id foreign key with the current_user's user_id
    current_user.userlines.push user_line

    if user_line.save
      redirect_to favorites_path
    else
      redirect_to new_favorite_path
      flash['favorites-warning'] = 'Looks like this is already a favorite line.'
    end
  end

  def destroy
    @favorite = Userline.find(params[:id])
    @favorite.destroy

    redirect_to favorites_path
  end
end
