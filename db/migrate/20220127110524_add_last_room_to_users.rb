class AddLastRoomToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_room, :integer, default: 1
  end
end
