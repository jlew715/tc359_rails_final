class ElectronicsStoresController < ApplicationController
  before_action :only_allow_signed_in_users, except: [:index, :show]
  before_action :set_electronics_store, only: [:show, :edit, :update, :destroy]

  # GET /electronics_stores
  # GET /electronics_stores.json
  def index
    @electronics_stores = ElectronicsStore.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /electronics_stores/1
  # GET /electronics_stores/1.json
  def show
  end

  # GET /electronics_stores/new
  def new
    @electronics_store = ElectronicsStore.new
  end

  # GET /electronics_stores/1/edit
  def edit
  end

  # POST /electronics_stores
  # POST /electronics_stores.json
  def create
    @electronics_store = ElectronicsStore.new(electronics_store_params)

    respond_to do |format|
      if @electronics_store.save
        format.html { redirect_to @electronics_store, notice: 'Electronics store was successfully created.' }
        format.json { render :show, status: :created, location: @electronics_store }
      else
        format.html { render :new }
        format.json { render json: @electronics_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electronics_stores/1
  # PATCH/PUT /electronics_stores/1.json
  def update
    respond_to do |format|
      if @electronics_store.update(electronics_store_params)
        format.html { redirect_to @electronics_store, notice: 'Electronics store was successfully updated.' }
        format.json { render :show, status: :ok, location: @electronics_store }
      else
        format.html { render :edit }
        format.json { render json: @electronics_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electronics_stores/1
  # DELETE /electronics_stores/1.json
  def destroy
    @electronics_store.destroy
    respond_to do |format|
      format.html { redirect_to electronics_stores_url, notice: 'Electronics store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electronics_store
      @electronics_store = ElectronicsStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def electronics_store_params
      params.require(:electronics_store).permit(:name, :main_address, :phone, :website, :email, :number_of_locations, :sells_tablets, :sells_phones)
    end
end
