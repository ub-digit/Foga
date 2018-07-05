class HelpInfosController < ApplicationController
  before_action :set_help_info, only: [:show, :edit, :update, :destroy]

  # GET /help_infos
  # GET /help_infos.json
  def index
    @help_infos = HelpInfo.all
  end

  # GET /help_infos/1
  # GET /help_infos/1.json
  def show
  end

  # GET /help_infos/new
  def new
    @help_info = HelpInfo.new
  end

  # GET /help_infos/1/edit
  def edit
  end

  # POST /help_infos
  # POST /help_infos.json
  def create
    @help_info = HelpInfo.new(help_info_params)

    respond_to do |format|
      if @help_info.save
        format.html { redirect_to @help_info, notice: 'Help info was successfully created.' }
        format.json { render :show, status: :created, location: @help_info }
      else
        format.html { render :new }
        format.json { render json: @help_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_infos/1
  # PATCH/PUT /help_infos/1.json
  def update
    respond_to do |format|
      if @help_info.update(help_info_params)
        format.html { redirect_to @help_info, notice: 'Help info was successfully updated.' }
        format.json { render :show, status: :ok, location: @help_info }
      else
        format.html { render :edit }
        format.json { render json: @help_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_infos/1
  # DELETE /help_infos/1.json
  def destroy
    @help_info.destroy
    respond_to do |format|
      format.html { redirect_to help_infos_url, notice: 'Help info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_info
      @help_info = HelpInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_info_params
      params.require(:help_info).permit(:helptext, :updated_by)
    end
end
