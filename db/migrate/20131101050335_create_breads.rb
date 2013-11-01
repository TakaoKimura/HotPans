class CreateBreads < ActiveRecord::Migration
  def change
    create_table :breads do |t|
      t.string :name
      t.string :kind

      t.timestamps
    end
  end
end
