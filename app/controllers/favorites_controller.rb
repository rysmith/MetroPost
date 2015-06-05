class FavoritesController < ApplicationController
  def index
    @favorites = Userline.all
  end

  def new
    @favorite = Userline.new
  end

  def create
    user_line = Userline.new(params.require(:userline).permit(:line_id, :user_id))
    current_user.userlines.push user_line
    if user_line.save
      redirect_to favorites_path
    else
      redirect_to new_favorite
    end
  end

  def edit
  end
end
