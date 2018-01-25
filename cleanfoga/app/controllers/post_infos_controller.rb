class PostInfosController < ApplicationController

before_action :find_postinfo, only: [:show, :edit, :update]
  
  def index
  	@post_infos = PostInfo.all.order("created_at DESC")
  end

  def new
  	@post_info = PostInfo.new
  end

  def create
  	@post_info = PostInfo.new(post_params)

  	if @post_info.save
  		redirect_to @post_info
  	else
  		render 'new'
  	end
  end

  def show
  	find_postinfo
  end

  def edit
  	#find_postinfo

  end

  def update
  	if @post_info.update(post_params)
  		redirect_to @post_info
  	else
  		render 'edit'
  	end
  end

end

private

def find_postinfo
	@post_info = PostInfo.find(params[:id])
end

def post_params
	params.require(:post_info).permit(:title, :comment, :created_by, :updated_by)
end
