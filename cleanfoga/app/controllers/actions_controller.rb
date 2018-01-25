class ActionsController < ApplicationController
  
before_action :find_action, only:[:show, :edit, :update]

  def index
  end

  def new
  	@action = Action.new
  end

  def create
  	@action = Action.new(action_params)
  	if @action.save
  		redirect_to @action
  	else
  		render 'new'
  	end
  end

  def show
  	find_action
  end

  def edit
  	
  end

  def update
  	if @action.update(action_params)
  		redirect_to @action
  	else
  		render 'edit'
  	end
  end

private

def find_action
	@action = Action.find(params[:id])
end

def action_params
	params.require(:action).permit(:action_type, :description)
end

end
