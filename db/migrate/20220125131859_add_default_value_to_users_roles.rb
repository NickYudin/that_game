class AddDefaultValueToUsersRoles < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role_id, :integer, default: 2
  end
end
