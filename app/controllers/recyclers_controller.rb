class RecyclersController < ApplicationController
  before_action :set_recycler, only: [:show, :edit, :update, :destroy]

  # GET /recyclers
  # GET /recyclers.json
  def index
    @recyclers = Recycler.all
  end

  # GET /recyclers/1
  # GET /recyclers/1.json
  def show
  end

  # GET /recyclers/new
  def new
    @recycler = Recycler.new
  end

  # GET /recyclers/1/edit
  def edit
  end

  # POST /recyclers
  # POST /recyclers.json
  def create
    @recycler = Recycler.new(recycler_params)

    respond_to do |format|
      if @recycler.save
        format.html { redirect_to @recycler, notice: 'Recycler was successfully created.' }
        format.json { render :show, status: :created, location: @recycler }
      else
        format.html { render :new }
        format.json { render json: @recycler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recyclers/1
  # PATCH/PUT /recyclers/1.json
  def update
    respond_to do |format|
      if @recycler.update(recycler_params)
        format.html { redirect_to @recycler, notice: 'Recycler was successfully updated.' }
        format.json { render :show, status: :ok, location: @recycler }
      else
        format.html { render :edit }
        format.json { render json: @recycler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recyclers/1
  # DELETE /recyclers/1.json
  def destroy
    @recycler.destroy
    respond_to do |format|
      format.html { redirect_to recyclers_url, notice: 'Recycler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recycler
      @recycler = Recycler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recycler_params
      params.require(:recycler).permit(:name, :address, :phone, :website, :email, :accepts_white_computer_paper, :accepts_corrugated_cardboard, :accepts_color_separated_glass)
    end
end
