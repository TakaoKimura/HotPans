class AddBreadStoreManagerToBreadStores < ActiveRecord::Migration
  def change
    add_column :bread_stores, :bread_store_manager_id, :integer
  end
end
