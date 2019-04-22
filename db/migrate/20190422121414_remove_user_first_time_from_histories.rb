class RemoveUserFirstTimeFromHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :user_first_time, :string
  end
end
