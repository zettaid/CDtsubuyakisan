class AddUserFirstNameToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :user_first_name, :string
  end
end
