class OperationsController < ApplicationController
  before_action :find_operation, only:[:show, :edit, :update]

  def index
  	@operations = Operation.all.order("created_at DESC")
  end

  def new
  	@operation = Operation.new
  end

  def create
  	@operation = Operation.new(operation_params)
  	if @operation.save
  		redirect_to @operation
  	else
  		render 'new'
  	end
  end

  def show
  	find_operation
  end

  def edit
  	
  end

  def update
  	if @operation.update(operation_params)
  		redirect_to @operation
  	else
  		render 'edit'
  	end
  end


  private

  def find_operation
  	@operation = Operation.find(params[:id])
  end

  def operation_params
  	params.require(:operation).permit(:operation_type, :description)
  end

end
 
