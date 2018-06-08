class UsersController < ApplicationController

   def new
   end

   def create
     user = User.new(user_params)
      if user.save
         session[:user_id] = user.id
         redirect_to post_infos_latest_path
      else
         redirect_to '/'
      end
   end

   def login
     @user = User.find_by_xname(params[:xname])
     if @user.password == params[:password]
       give_token
     else
       redirect_to '/'
     end
   end

private
   def user_params
     params.require(:user).permit(:xname, :password, :password_confirmation)
   end


end
