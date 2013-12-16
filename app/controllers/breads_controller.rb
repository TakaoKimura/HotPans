class BreadsController < ApplicationController
  #before_filter :require_login, :except => [:index]
  before_filter :require_login
  before_action :set_bread, only: [:show, :edit, :update, :destroy]

  # GET /breads
  # GET /breads.json
  def index
    @bread_store = current_bread_store_manager.bread_store
    if !@bread_store.nil?
      @breads = @bread_store.breads
    end
  end

  # GET /breads/1
  # GET /breads/1.json
  def show
  end

  # GET /breads/new
  def new
    @bread = Bread.new
  end

  # GET /breads/1/edit
  def edit
  end

  # POST /breads
  # POST /breads.json
  def create
    @bread = Bread.new(bread_params)
    @bread.bread_store_id = current_bread_store_manager.bread_store.id

    respond_to do |format|
      if @bread.save
        format.html { redirect_to @bread, notice: 'パンを作成した.' }
        format.json { render action: 'show', status: :created, location: @bread }
      else
        format.html { render action: 'new' }
        format.json { render json: @bread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breads/1
  # PATCH/PUT /breads/1.json
  def update
    respond_to do |format|
      if @bread.update(bread_params)
        format.html { redirect_to @bread, notice: 'パン情報を編集した.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breads/1
  # DELETE /breads/1.json
  def destroy
    @bread.destroy
    respond_to do |format|
      format.html { redirect_to breads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bread
      @bread = Bread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bread_params
      params.require(:bread).permit(:name, :kind)
    end
end
