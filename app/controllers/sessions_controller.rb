class SessionsController < ApplicationController

  #create a new user object so the form in view/users/new.html.erb can do it's job
  #this only cretes a user object
  def new
    @user = User.new
  end

  #what's our goal?
  #receive user data from the view and give it to the model (POST)
  #the model will handle the db interationc
  def create

    #the .where method generates a SQL statement in the db
    #the db then returns an array of objects
    #each object in the array corresponds to a row in the columns in the User table
    #because email is unique we know we are only getting one user object
    #we need to use .first to get the first (and only) object out of that array
    #all of that is then assigned to the user variable so we can use it to authenticate
    #user_params is the method defined below
    user = User.where(email: user_params[:email]).first

    #now that we have the key (email) we need to validate the user.
    #the .authenticate method is prebuilt and comes from AR via the ApplicationController
    if user and user.authenticate(user_params[:password])

      #the local variable :session marks that fact that a user has logged in
      #:session will be accessible until the user logs out.
      session[:user_id] = user.id
      session[:user_username] = user.username

      #flash is sending a string for one get cycle
      #flash's argument (:success) should be used as a css class in the view
      flash[:success] = "Welcome, #{session[:user_username]}"

      #redirect the view to welcome#index
      redirect_to welcome_path
    else

      flash[:danger] = 'incorrect password or email, give it another try...'
      redirect_to new_session_path
    end
  end

  def destroy

    session[:user_id] = nil
    flash[:success] = 'You have been logged out'
    redirect_to welcome_path
  end


#make the following methods private so they are only accessible in the current controller
private

  #the user_params is returning a hash with the :email and :password key/value pairs
  #this is so we can compare a email/password input to a email/input database
  def user_params

    #params is big hash that looks something like this:
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"+ccopJDDdWxVKXsy8jBSjl9lXO8iOamUPiBtCjMw/BnmvudXi6y5TcDPO6KPLIN4sRJGT7c42sHCrkjOYt/B1Q==", "user"=>{"email"=>"ryan@smith.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Register"}
    #.require is just targeting the key :user, which returns:
    #"user"=>{"email"=>"ryan@smith.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Register"}
    #.permit is targeting just the two key/value pairs we want: email and password.
  params.require(:user).permit(:email, :password)
  end
end
