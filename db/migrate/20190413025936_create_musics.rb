class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :cd_id, :null => false
      t.string :name, :null => false
      t.integer :track, :null => false
      t.integer :disk_number, :null => false

      t.timestamps
    end
  end
end
