class HelpInfosController < ApplicationController
  before_action :authenticate
  before_action :find_help_info, only: [ :show, :edit, :update, :destroy]
  before_action :an_admin, only:[:index, :new, :edit, :update, :destroy]

 
 
  def new
    # Only allow the creation of a new help section
    # if there isn't one already present.
    @help_info = HelpInfo.new
  end


  def show
    rescue ActiveRecord::RecordNotFound
      pp "######## no such entry"
      redirect_to new_help_info_path
  end


  def edit
  end


  def create
    @help_info = HelpInfo.new(help_info_params)
    @help_info.updated_by = @current_user.xname
      if @help_info.save
        redirect_to post_infos_search_path
      end      
  end

  def update
      @help_info.updated_by = @current_user.xname
      if @help_info.update(help_info_params)
        redirect_to post_infos_search_path
      end
  end

  def destroy
    @help_info.destroy
  end

  private

    def find_help_info
      @help_info = HelpInfo.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_info_params
      params.require(:help_info).permit(:helptext, :updated_by)
    end
end
