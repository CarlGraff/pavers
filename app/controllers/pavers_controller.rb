require "net/http"
require "uri"
class PaversController < ApplicationController
  before_action :set_paver, only: [:show, :edit, :update, :destroy]
  

  # GET /pavers
  # GET /pavers.json
  def index
    @pavers = Paver.all.sort_by{|m| m.Name}
    if params[:search]
        @pavers = Paver.search(params[:search]).order("Name")
        else
        @pavers = Paver.where("Name = 'XYZ'").order("Name")
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

  # GET /pavers/purcahse
  def purchase
    session[:paver_params] = "empty"  
    @paver = Paver.new
  end

# GET /pavers/purcahse_create
  def purchase_create
    @paver = Paver.new(paver_params)
    #debugger
    if @paver.valid?()
      session[:paver_params] = paver_params  
      if Rails.env.development?   
        if @paver[Paver] == "4x8"
          redirect_to action: "paypal_shim"
        elsif @paver[Paver] == "8x8-4"
          redirect_to action: "paypal_shim"
        elsif @paver[Paver] == "8x8-5"      
          redirect_to action: "paypal_shim"
        else
          render :purchase
        end
      else
        if @paver[Paver] == "4x8"
          redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=GYHB5J5EVGEK2"  
        elsif @paver[Paver] == "8x8-4"
          redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=T6KKJZ6MVMN7C"
         elsif @paver[Paver] == "8x8-5"   
          redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JB9F49XD5Z2NC"
        else
          render :purchase
        end
      end
    else
      render :purchase
    end  
  end

  def paypal_shim
     #render :text => "paypal_shim"
  end


  def purchase_success
    @paver = Paver.new(session[:paver_params])

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

  def purchase_cancel
    flash[:notice] = "Paver was was Canceled."
    redirect_to root_path
  end

  def prompt_for_edit
    #debugger
    current = Paver.find(params[:format]) 
    if (current.Email.downcase == params[:Email_Prompt].downcase)
      redirect_to edit_paver_path(params[:format])
    else
      #redirect_to show_paver_path(params[:format])
      flash[:notice] = "Paver: Incorrect Email entered to enable Editing."
      redirect_to paver_path(params[:format])
    end
  end

  # GET /pavers/1/edit
  def edit 
  end

  # POST /pavers
  # POST /pavers.json
  def create
    @paver = Paver.new(paver_params)
    #debugger
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
      params.require(:paver).permit(:Name, :Logo, :Line1, :Line2, :Line3, :Line4, :Line5, :Paver, :Placement, :Row, :Col,
                                    :Install_Date, :Purchaser, :Email, :PayPal_ID, :Email_Prompt)
    end

end
