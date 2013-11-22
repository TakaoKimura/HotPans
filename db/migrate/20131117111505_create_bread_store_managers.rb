class CreateBreadStoreManagers < ActiveRecord::Migration
  def change
    create_table :bread_store_managers do |t|
      t.string :manager_name

      t.timestamps
    end
  end
end
