class CommentsController < ApplicationController

  #show all comments in the comment view
  def index
    @comments = Comment.all
  end

  #create a new comment object and send it over to the form
  def new
    @comment = Comment.new
  end

  #
  def create
    comment = Comment.new(params.require(:comment).permit(:comment_title, :comment_text))
    if comment.save
      redirect_to comments_path
    else
      redirect_to new_comment
    end
  end

  def edit
  end

  def update
  end

  def show
  end
end
