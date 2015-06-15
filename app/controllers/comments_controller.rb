class CommentsController < ApplicationController


  def index

    #show all comments in the comment view
    @comments = Comment.all.order(created_at: :desc)

    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end

  end


  def new

    #create a new comment object and send it over to the form
    @comment = Comment.new
    # @comment_line = Commentline.new

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
    # comment_line = Commentline.new(params.require(:comment_line).permit(:line_id))

    #auto update the commentlines table with foreign key from comment and line
    current_user.comments.push comment
    # line.push comment

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

    #display the username when logged in
    if current_user
      @welcome_message = "Welcome, #{session[:user_username]}"
    end
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
    # @comment_line = Commentline.find_by(comment_id: params[:id])
    # @comment_line.destroy



    redirect_to comments_path

  end
end
