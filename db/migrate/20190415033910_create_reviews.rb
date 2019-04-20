class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :image_id
      t.text :text
      t.integer :user_id
      t.integer :cd_id
      t.boolean :deleated

      t.timestamps
    end
  end
end
