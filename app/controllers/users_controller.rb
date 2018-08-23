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
      render 'new'
    end
  end

  def show
    @users = User.all.order("is_active desc, xname")
  end

  def edit

  end

  def update     
  if @user.update(user_params) 
      redirect_to allusers_path
    else
      render 'edit'
    end 
  end

  def destroy
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
