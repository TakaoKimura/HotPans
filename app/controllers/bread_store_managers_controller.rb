class BreadStoreManagersController < ApplicationController
  def index
    if bread_store_manager_signed_in?
      @bread_store_manager = current_bread_store_manager
      @bread_store = @bread_store_manager.bread_store
    end
  end
end
