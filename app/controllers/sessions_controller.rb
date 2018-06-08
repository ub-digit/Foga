class SessionsController < ApplicationController

def new
end

def create
   user = User.find_by_xname(params[:xname])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to post_infos_latest_path
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
end

def destroy
   session.delete(:user_id)
   redirect_to '/login'
end

end
