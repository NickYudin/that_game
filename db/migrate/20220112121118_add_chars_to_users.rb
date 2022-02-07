class AddCharsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :character_id, :integer
  end
end
