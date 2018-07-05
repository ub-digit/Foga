class OperationsController < ApplicationController
  before_action :find_operation, only:[:show, :edit, :update, :destroy]
  before_action :authenticate
  before_action :an_admin, only:[:edit, :update, :destroy]

  def index
  	@operations = Operation.all.order("operation_type")
    #.order("created_at DESC")
  end

  def new
  	@operation = Operation.new
  end

  def create
  	@operation = Operation.new(operation_params)
  	if @operation.save
  		redirect_to @operation
  	else
      pp @operation.errors
  		render 'new'
  	end
  end

  def show
  	find_operation
  end

  def edit
    redirect_to operations_path unless an_admin
      
    pp "##### wanting to edit ##### "
  end

  def update
  	if @operation.update(operation_params)
  		redirect_to @operation
  	else
  		render 'edit'
  	end
  end

  def destroy
    @operation.destroy
    redirect_to operations_path
  end


  private

  def find_operation
  	@operation = Operation.find(params[:id])
  end

  def operation_params
  	params.require(:operation).permit(:operation_type, :description)
  end

  def an_admin
    # printing this twice. why???
    pp "### CHECKING IF ADMIN ##### "
    pp @current_user.is_admin
    @current_user.is_admin
  end

end
 
