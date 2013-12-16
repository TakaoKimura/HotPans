class AddBreadStoreToBreads < ActiveRecord::Migration
  def change
    add_column :breads, :bread_store_id, :integer
  end
end
