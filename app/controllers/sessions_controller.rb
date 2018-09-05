class SessionsController < ApplicationController

def new
end

def create
   user = User.find_by_xname(params[:session][:xname])
   
   # user.authenticate is a bcrypt method that checks the password.
   if user && user.authenticate(params[:session][:password])
   
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to post_infos_search_path
   else
    # If user's login doesn't work, send them back to the login form.
      flash[:warning] = 'Fel användarenamn eller lösenord.'
      
      redirect_to '/login'
   end
end

def destroy
   reset_session
   redirect_to '/login'
end

end
