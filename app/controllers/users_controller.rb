class UsersController < ApplicationController
  before_action :authenticate
  before_action :user_params, only:[:create, :login]
  before_action :an_admin
  #before_action :find_user, only:[:show]


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

  def show
    @users = User.all
  end

  def login
   user = User.find(params[:xname])
   if user.password == params[:password]
     give_token
   else
    redirect_to '/'
   end
  end

private
  def user_params
    params.require(:user).permit(:xname, :password, :password_confirmation, :is_admin)
  end

  # def find_user
  #   @user = User.find(params[:id])
  # end

end
