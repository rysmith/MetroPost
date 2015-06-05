class FavoritesController < ApplicationController


  def index

    #in the index view we are only showing the current_user's favorites
    @favorites = Userline.all

  end


  def new

    #send over a new favorite object for the user to fill in
    @favorite = Userline.new

  end

  def create

    #recieve the favorite object back from the view
    user_line = Userline.new(params.require(:userline).permit(:line_id, :user_id))

    #auto update the user_id foreign key with the current_user's user_id
    current_user.userlines.push user_line

    if user_line.save
      redirect_to favorites_path
    else
      redirect_to new_favorite
    end
  end
end
