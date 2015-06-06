class CommentsController < ApplicationController


  def index

    #show all comments in the comment view
    @comments = Comment.all

    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end

  end


  def new

    #create a new comment object and send it over to the form
    @comment = Comment.new

    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end

  end

  #currently only the :comment_title and :comment_text are being saved
  #need to update with line information
  def create

    #receive params from view and add them to the db
    comment = Comment.new(params.require(:comment).permit(:comment_title, :comment_text))

    #auto update the user_id foreign key with the current_user's user_id
    current_user.comments.push comment

    if comment.save

      #if we have a successful save, show all comments
      redirect_to comments_path

    else

      #else render the form again
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
