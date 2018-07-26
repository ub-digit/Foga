class SessionsController < ApplicationController

def new
end

def create
   user = User.find_by_xname(params[:session][:xname])

   # If the user exists AND the password entered is correct.
   if user && user.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to post_infos_latest_path
   else
    # If user's login doesn't work, send them back to the login form.
      pp "---Session login ERROR---"
      redirect_to '/login' #, notice: "SESH FAIL"
   end
end

def destroy
   reset_session
   
   redirect_to '/login'
end

end
