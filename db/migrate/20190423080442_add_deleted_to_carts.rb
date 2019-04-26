class AddDeletedToCarts < ActiveRecord::Migration[5.2]
  def change
  	# 
    add_column :carts, :deleted, :boolean, default:false, null: false
  end
end
