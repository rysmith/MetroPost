class SessionsController < ApplicationController

  #we are creating a new user object here simply so the form can do it's job
  #this doesn't actually create a new user
  def new
    @user = User.new
  end

  def create

    #the .where method generates a SQL statement that returns an array of objects
    #the array of objects are the rows of the columns in the user table
    #we need to use .first we need to get the information out of that array
    #because email is unique we know we are only getting one user object
    #.first will return that one user object
    #all of that is then assigned to the user variable so we can use it to authenticate
    #where does the user_params is the method defined below
    user = User.where(email: user_params[:email]).first

    #now that we have the key (email) we need to validate the user.
    #the .authenticate method is prebuilt and comes from AR via the ApplicationController
    if user and user.authenticate(user_params[:password])

      #this locally marks that fact that a user has logged in
      #and will be accessible until the user logs out.
      #where does session come from?
      session[:user_id] = user.id
      session[:user_username] = user.username
      flash[:success] = "Welcome, #{session[:user_username]}"
      redirect_to welcome_path
    else
      flash[:error] = "incorrect password or email, give it another try..."
      redirect_to new_session_path
    end
  end

  def destroy

    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to welcome_path
  end


#make the following methods private so they are only accessible in the current controller
private

  #the user_params is returning a hash with :email and :password key/value pairs
  def user_params

    #params is big hash that looks something like this:
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"+ccopJDDdWxVKXsy8jBSjl9lXO8iOamUPiBtCjMw/BnmvudXi6y5TcDPO6KPLIN4sRJGT7c42sHCrkjOYt/B1Q==", "user"=>{"email"=>"ryan@smith.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Register"}
    #.require is just targeting the key :user, which returns:
    #"user"=>{"email"=>"ryan@smith.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Register"}
    #.permit is targeting just the two key/value paris we want the email and the password.
  params.require(:user).permit(:email, :password)
  end
end
