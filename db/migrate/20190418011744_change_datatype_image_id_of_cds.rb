class ChangeDatatypeImageIdOfCds < ActiveRecord::Migration[5.2]
  def change
  	change_column :cds, :image_id, :string
  end
end
