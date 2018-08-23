class PostInfosController < ApplicationController

# This finds the current object (with the passed in id, and is thereafter 
# available to the stated functions show, edit, update and destroy. This is 
# done before any other action. Duh)
  before_action :find_postinfo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
     redirect_to post_infos_search_path
  end

  def new
  	@post_info = PostInfo.new
  end

  def create
  	@post_info = PostInfo.new(post_params)
    @post_info.created_by = @current_user.xname
    @post_info.updated_by = @post_info.created_by
  	
    if @post_info.save
  		redirect_to @post_info
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
    @post_info.updated_by = @current_user.xname
    if @post_info.update(post_params) 
  		redirect_to @post_info
  	else
  		render 'edit'
  	end
  end

  def destroy
    @post_info.show = false;
    @post_info.save
    redirect_to post_infos_path
  end

  def latest
    @days = params[:days].to_i
    if @days == 0
      @days = 7
    end
    @post_infos = PostInfo.all.where("DATE(updated_at) > (NOW() - INTERVAL '? DAY') AND show = true", 
                      @days).order("updated_at DESC").paginate(:page => params[:page])
  end

  def search  
    if params[:q] != nil
      params[:q].permit!
      params[:q][:show_true] = "1"  #Only show posts that aren't "deleted"
    end

    #look at @search for åäö problem. SQL done when???
    @search = PostInfo.search(params[:q])
    @search.sorts = 'title asc' if @search.sorts.empty?
    # Default value is chosen if none is selected (in case params[:aper_page]=nil).
    show_per_page = params[:aper_page] || 50
    @post_infos = @search.result.paginate(per_page: show_per_page, page: params[:page])
  end 



  def op_exists(this_post_info = @post_info)
    if Operation.find_by(id: this_post_info.operation_id)  
      Operation.find_by(id: this_post_info.operation_id).operation_type 
    else 
      "Okänd åtgärd" 
    end 
  end
  helper_method :op_exists

end

private

def find_postinfo
	@post_info = PostInfo.find(params[:id])
end

def post_params
	params.require(:post_info).permit(:title, :publisher, :issn, :comment, :operation_id)
end
