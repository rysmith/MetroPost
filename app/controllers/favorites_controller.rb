class FavoritesController < ApplicationController
  def index
    @favorites = Line.all
  end

  def new
  end

  def create

  end

  def edit
  end
end
