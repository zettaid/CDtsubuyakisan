class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :body
      t.string :master
      t.string :post_number
      t.text :address
      t.string :phone_number
      t.text :email

      t.timestamps
    end
  end
end
