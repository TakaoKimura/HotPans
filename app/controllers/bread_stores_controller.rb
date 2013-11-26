class BreadStoresController < ApplicationController
  before_filter :require_login, :except => [:index]
  before_action :set_bread_store, only: [:show, :edit, :update, :edit_confirm, :destroy]

  # GET /bread_stores
  # GET /bread_stores.json
  def index
    @bread_stores = BreadStore.all
  end

  # GET /bread_stores/1
  # GET /bread_stores/1.json
  def show
  end

  # GET /bread_stores/new
  def new
    user_bread_store = current_bread_store_manager.bread_store
    if user_bread_store.nil?
      @bread_store = BreadStore.new
    else
      redirect_to edit_bread_store_path(user_bread_store)
    end
  end
  
  # POST /bread_stores/confirm
  def confirm
    @bread_store = BreadStore.new(bread_store_params)
    if !@bread_store.valid?
      render :new
    end
  end

  # GET /bread_stores/1/edit
  def edit
    param_id = params[:id].to_i
    user_bread_store = current_bread_store_manager.bread_store
    if user_bread_store.nil?
      redirect_to new_bread_store_path
    elsif user_bread_store.id == param_id
      @bread_store = user_bread_store
    else
      redirect_to edit_bread_store_path(user_bread_store)
    end
  end
  
  # POST /bread_stores/1/edit_confirm
  def edit_confirm
    @bread_store = BreadStore.find(params[:id])
    @bread_store.attributes = bread_store_params
    if !@bread_store.valid?
      render :edit
    end
  end

  # POST /bread_stores
  # POST /bread_stores.json
  def create
    @bread_store = BreadStore.new(bread_store_params)
    @bread_store.bread_store_manager_id = current_bread_store_manager.id

    respond_to do |format|
      if @bread_store.save
        format.html { redirect_to @bread_store, notice: 'パン屋を作成した.' }
        format.json { render action: 'show', status: :created, location: @bread_store }
      else
        format.html { redirect_to bread_stores_url, notice_error: 'エラーが発生した。'}
      end
    end
  end

  # PATCH/PUT /bread_stores/1
  # PATCH/PUT /bread_stores/1.json
  def update
    @bread_store.bread_store_manager_id = current_bread_store_manager.id
    respond_to do |format|
      if @bread_store.update(bread_store_params)
        format.html { redirect_to @bread_store, notice: 'パン屋情報を編集した.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @bread_store, notice_error: 'エラーが発生した。'}
      end
    end
  end

  # DELETE /bread_stores/1
  # DELETE /bread_stores/1.json
  def destroy
    @bread_store.destroy
    respond_to do |format|
      format.html { redirect_to bread_stores_url }
      format.json { head :no_content }
    end
  end
  
  # Form validator
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bread_store
      @bread_store = BreadStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bread_store_params
      params.require(:bread_store).permit(:name, :phone_number, :address)
    end
end
