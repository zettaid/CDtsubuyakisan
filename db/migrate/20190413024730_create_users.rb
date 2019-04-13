class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :post_number
      t.string :phone_number
      t.text :address
      t.text :email
      t.string :password
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :admin
      t.boolean :deleated

      t.timestamps
    end
  end
end
