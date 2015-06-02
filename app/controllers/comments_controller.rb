class CommentsController < ApplicationController

  #show all comments in the comment view
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
