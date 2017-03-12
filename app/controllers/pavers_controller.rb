class PaversController < ApplicationController
  before_action :set_paver, only: [:show, :edit, :update, :destroy]

  # GET /pavers
  # GET /pavers.json
  def index
    @pavers = Paver.all
    if params[:search]
        @pavers = Paver.search(params[:search]).order("created_at DESC")
        else
        @pavers = Paver.where("Name = 'XYZ'")
    end
  end

  # GET /pavers/1
  # GET /pavers/1.json
  def show
  end

  # GET /pavers/new
  def new
    @paver = Paver.new
  end

  # GET /pavers/1/edit
  def edit
    
  end

  # POST /pavers
  # POST /pavers.json
  def create
    @paver = Paver.new(paver_params)

    respond_to do |format|
      if @paver.save
        format.html { redirect_to @paver, notice: 'Paver was successfully created.' }
        format.json { render :show, status: :created, location: @paver }
      else
        format.html { render :new }
        format.json { render json: @paver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pavers/1
  # PATCH/PUT /pavers/1.json
  def update
    respond_to do |format|
      if @paver.update(paver_params)
        format.html { redirect_to @paver, notice: 'Paver was successfully updated.' }
        format.json { render :show, status: :ok, location: @paver }
      else
        format.html { render :edit }
        format.json { render json: @paver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pavers/1
  # DELETE /pavers/1.json
  def destroy
    @paver.destroy
    respond_to do |format|
      format.html { redirect_to pavers_url, notice: 'Paver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paver
      @paver = Paver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paver_params
      params.require(:paver).permit(:Name, :Logo, :Line1, :Line2, :Line3, :Line4, :Line5, :Paver, :Placement, :Row, :Col, :PayPal_ID)
    end

end
