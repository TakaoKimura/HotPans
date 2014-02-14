class BreadsController < ApplicationController
  #before_filter :require_login, :except => [:index]
  before_filter :require_login, :except => [:yakiagari_breads] 
  before_action :set_bread, only: [:show, :edit, :edit_confirm, :update, :destroy]
  before_action :set_yakiagari_fix_time

  # GET /breads
  # GET /breads.json
  def index
    @bread_store = current_bread_store_manager.bread_store
    if !@bread_store.nil?
      @breads = @bread_store.breads
      @breads.each do |bread|
        start_yakiagari_time = bread.last_start_yakiagari_time
        if bread.is_yakiagari == true and start_yakiagari_time < (Time.new - @yakiagari_fix_time)
          bread.last_end_yakiagari_time = start_yakiagari_time + @yakiagari_fix_time
          bread.is_yakiagari = false
          bread.save
        end
      end
    end
  end

  # GET /breads/1
  # GET /breads/1.json
  def show
  end

  # GET /breads/yakiagari_breads
  def yakiagari_breads
    @yakiagari_breads = Bread.where(is_yakiagari: true).order("last_start_yakiagari_time DESC")
    
    # Auto end yakiagari status after yakiagari_fix_time
    @yakiagari_breads.each do |bread|
      start_yakiagari_time = bread.last_start_yakiagari_time
      if start_yakiagari_time < (Time.new - @yakiagari_fix_time)
        @yakiagari_breads -= [bread]
        bread.last_end_yakiagari_time = start_yakiagari_time + @yakiagari_fix_time
        bread.is_yakiagari = false
        bread.save
      end
    end

    @bread_store_id = params[:bread_store_id]
    if !@bread_store_id.nil?
      @bread_store = BreadStore.find(@bread_store_id)
      @bread_stores = [@bread_store]
      @hash = Gmaps4rails.build_markers(@bread_stores) do |bread_store, marker|
        marker.lat bread_store.latitude
        marker.lng bread_store.longitude
        marker.infowindow bread_store.name
      end
    end
  end

  # GET /breads/1/start_yakiagari
  def start_yakiagari
    @bread = Bread.find(params[:id])
    if @bread.nil? or @bread.bread_store_id != current_bread_store_manager.bread_store.id 
      redirect_to breads_path
    else
      @bread.last_start_yakiagari_time = Time.new
      @bread.is_yakiagari = true
      @bread.save
      redirect_to breads_path, notice: 'パンが焼き上がりました。'
    end
  end

  # GET /breads/1/end_yakiagari
  def end_yakiagari
    @bread = Bread.find(params[:id])
    if @bread.nil? or @bread.bread_store_id != current_bread_store_manager.bread_store.id
      redirect_to breads_path
    else
      @bread.last_end_yakiagari_time = Time.new
      @bread.is_yakiagari = false
      @bread.save
      redirect_to breads_path, notice: 'パンが普通に戻りました。'
    end
  end

  # GET /breads/new
  def new
    @bread = Bread.new(bread_params)
  end

  # GET /breads/confirm
  def confirm
    @bread = Bread.new(bread_params)
    if !@bread.valid?
      render :new
    elsif !check_duplicate_bread_name_one_store(bread_params["name"])
      @bread.errors.add(:name, "Error Duplicate Bread Name")
      render :new
    end
  end

  # GET /breads/1/edit
  def edit
    if @bread.bread_store_id != current_bread_store_manager.bread_store.id
      redirect_to breads_path
    end
    @bread.attributes = bread_params
  end

  # GET /breads/1/edit_confirm
  def edit_confirm
    @bread.attributes = bread_params
    if !@bread.valid?
      render :edit
    elsif !check_duplicate_bread_name_one_store(bread_params["name"], @bread.id)
      @bread.errors.add(:name, "Error Duplicate Bread Name")
      render :new
    end
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
    # No duplicate bread's name for one bread store    
    def check_duplicate_bread_name_one_store(bread_name_in, bread_id_in = nil)
       bread_store = current_bread_store_manager.bread_store
       if bread_store.nil?
         return true
       end
       breads = bread_store.breads
       if breads.empty?
         return true
       end
       breads.each do |bread|
         if bread.id != bread_id_in and bread.name == bread_name_in
           return false
         end
       end
       return true
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bread
      @bread = Bread.find(params[:id])
    end

    # Set yakiagari_fix_time
    def set_yakiagari_fix_time
      @yakiagari_fix_time = 30.minutes
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bread_params
      if !params[:bread].nil?
        params.require(:bread).permit(:name, :kind)
      end
    end
end
