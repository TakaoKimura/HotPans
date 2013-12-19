class AddYakiagariDataToBread < ActiveRecord::Migration
  def change
    add_column :breads, :is_yakiagari, :boolean
    add_column :breads, :last_start_yakiagari_time, :datetime
    add_column :breads, :last_end_yakiagari_time, :datetime
  end
end
