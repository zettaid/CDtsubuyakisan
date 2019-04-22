class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :cart_id
      t.integer :status
      t.text :address
      t.datetime :created_at
      t.datetime :updated_at
      t.string :user_first_time
      t.string :user_last_name
      t.string :post_number

      t.timestamps
    end
  end
end
