class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.integer :artist_id, :null => false
      t.string :cd_name, :null => false
      t.integer :image_id
      t.integer :price, :null => false
      t.integer :label_id, :null => false
      t.integer :stock, :null => false
      t.integer :genre_id, :null => false
      t.boolean :deleated, :default => false

      t.timestamps
    end
  end
end
