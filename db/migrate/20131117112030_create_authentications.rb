class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :bread_store_manager_id
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps
    end
  end
end
