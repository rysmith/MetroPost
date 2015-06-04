class CommentsController < ApplicationController

  #show all comments in the comment view
  def index
    @comments = Comment.all
  end

  #create a new comment object and send it over to the form
  def new
    @comment = Comment.new
  end

  #currently only the :comment_title and :comment_text are being saved
  #need to update with line information
  def create
    comment = Comment.new(params.require(:comment).permit(:comment_title, :comment_text))
    if comment.save
      redirect_to comments_path
    else
      redirect_to new_comment
    end
  end

  #caputure one row of the Comments table and store it in @comment
  #find is a method the Comment class gets from Active Record
  #params is the @comment hash we are sending over to the show view
  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params.require(:comment).permit(:comment_title, :comment_text, :user_id))
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end


end
