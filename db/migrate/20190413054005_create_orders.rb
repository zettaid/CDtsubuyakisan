class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :price
      t.integer :cart_id
      t.integer :quantity
      t.integer :cd_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
