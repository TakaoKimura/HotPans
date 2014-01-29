class AddGoogleMapsInfoToBreadStores < ActiveRecord::Migration
  def change
    add_column :bread_stores, :latitude, :float
    add_column :bread_stores, :longitude, :float
  end
end
