class UsersController < ApplicationController
  before_action :authenticate
  before_action :user_params, only:[:create, :login]
  before_action :an_admin
  before_action :find_user, only: [:edit, :update, :destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to allusers_path
    else
      pp "---ERROR creating NEW user account---"
      render 'new'
      #redirect_to signup_path
    end
  end

  def show
    @users = User.all
  end

  def edit
    pp "---- USER EDIT"
  end

  def update   
    pp "----- UPDATE USER"  
  if @user.update(user_params) 
      redirect_to allusers_path
    else
      render 'edit'
    end 
  end

  def destroy
  end

  def login
   user = User.find(params[:xname])
   if user.password == params[:password]
     give_token
   else
    pp "---User login failed---"
    redirect_to '/'
   end
  end

private
  def user_params
    params.require(:user).permit(:xname, :name, :password, 
      :password_confirmation, :is_admin, :is_active)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
