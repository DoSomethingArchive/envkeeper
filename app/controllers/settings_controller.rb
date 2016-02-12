class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy, :versions]
  before_action :set_parent, only: [:new, :create]
  before_action :prefill_all_environments, only: [:edit, :show]

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
    @project.environments.each do |environment|
      @setting.values.build environment: environment
    end
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = Setting.new(setting_params)
    @setting.project = @project

    respond_to do |format|
      if @setting.save
        format.html { redirect_to project_url(@project), notice: 'Setting was successfully created.' }
        format.json { render :show, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      # byebug
      if @setting.update(setting_params)
        format.html { redirect_to [@project, @setting], notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def versions
    @value = Value.find(params[:value_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
      @project = @setting.project
    end

    def set_parent
      @project = Project.friendly.find(params[:project_id])
    end

    def prefill_all_environments
      @project.environments.each do |environment|
        unless @setting.environments.exists?(environment)
          @setting.values.build environment: environment
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:name,
        values_attributes: [:id, :environment_id, :data]
      )
    end
end
