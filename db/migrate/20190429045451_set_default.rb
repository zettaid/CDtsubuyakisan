class SetDefault < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:histories, :status, 0)
  end
end
