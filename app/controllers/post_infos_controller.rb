class PostInfosController < ApplicationController



# This finds the current object (with the passed in id, and is thereafter 
# available to the stated functions show, edit, update and destroy. This is 
# done before any other action. Duh)
  before_action :find_postinfo, only: [:show, :edit, :update, :destroy]
  

  def index
<<<<<<< 93d32029b7fc75217b1e8914c05a0a6cad14dde0:app/controllers/post_infos_controller.rb
<<<<<<< cfd1fc68ca4dfdbe6570ff9a8693e2abf03767f8:app/controllers/post_infos_controller.rb
  	@post_infos = PostInfo.all
=======
    
    @post_infos = PostInfo.all.where("DATE(created_at) > (NOW() - INTERVAL '30 DAY')").order("created_at DESC")
>>>>>>> Started using Ransack bundle. Search on title implemented but not displayed correctly.:cleanfoga/app/controllers/post_infos_controller.rb
=======
     @search = PostInfo.search(params[:q])
     @post_infos = @search.result
>>>>>>> Search functionality with display in index and separate latest page. TBC.:cleanfoga/app/controllers/post_infos_controller.rb
  end

  def new
    # When creating a new post, should assign that automatically to the currently logged in user.
    #@post_info = current_user.post_info.build

  	@post_info = PostInfo.new
  end

  def create
    # When creating a new post, should assign that automatically to the currently logged in user.
    #@post_info = current_user.post_info.build(post_params)

  	@post_info = PostInfo.new(post_params)
    @post_info.updated_by = @post_info.created_by
  	
    if @post_info.save
  		redirect_to @post_info
  	else
      pp @post_info.errors  #show errors in terminal window

  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
    # When a post, should set updated_by automatically to the currently logged in user.

    #trying to disallow changing created by when in update mode
    #org_created_by = @post_info.created_by
    #post_params.created_by = @post_info.created_by
  	if @post_info.update(post_params)
  		redirect_to @post_info
  	else
  		render 'edit'
  	end
  end

  def destroy
    @post_info.destroy
    redirect_to post_infos_path
  end

  def latest
    @post_infos = PostInfo.all.where("DATE(created_at) > (NOW() - INTERVAL '30 DAY')").order("created_at DESC")   
  end

  def search
    #do the search things
     @search = PostInfo.search(params[:q])
     @post_infos = @search.result
  end 

end


private

def find_postinfo
	@post_info = PostInfo.find(params[:id])
end

def post_params
	params.require(:post_info).permit(:title, :publisher, :issn, :comment, :created_by, :updated_by, :operation_id)
end
