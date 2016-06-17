class PaverAppsController < ApplicationController
  before_action :set_paver_app, only: [:show, :edit, :update, :destroy]

  # GET /paver_apps
  # GET /paver_apps.json
  def index
    @paver_apps = PaverApp.all
  end

  # GET /paver_apps/1
  # GET /paver_apps/1.json
  def show
  end

  # GET /paver_apps/new
  def new
    @paver_app = PaverApp.new
  end

  # GET /paver_apps/1/edit
  def edit
  end

  # POST /paver_apps
  # POST /paver_apps.json
  def create
    @paver_app = PaverApp.new(paver_app_params)

    respond_to do |format|
      if @paver_app.save
        format.html { redirect_to @paver_app, notice: 'Paver app was successfully created.' }
        format.json { render :show, status: :created, location: @paver_app }
      else
        format.html { render :new }
        format.json { render json: @paver_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paver_apps/1
  # PATCH/PUT /paver_apps/1.json
  def update
    respond_to do |format|
      if @paver_app.update(paver_app_params)
        format.html { redirect_to @paver_app, notice: 'Paver app was successfully updated.' }
        format.json { render :show, status: :ok, location: @paver_app }
      else
        format.html { render :edit }
        format.json { render json: @paver_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paver_apps/1
  # DELETE /paver_apps/1.json
  def destroy
    @paver_app.destroy
    respond_to do |format|
      format.html { redirect_to paver_apps_url, notice: 'Paver app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paver_app
      @paver_app = PaverApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paver_app_params
      params.require(:paver_app).permit(:Name, :Line1, :Line2, :Line3, :Line4, :Paver, :Placement, :Row, :Col)
    end
end
