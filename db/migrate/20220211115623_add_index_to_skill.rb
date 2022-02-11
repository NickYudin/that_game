class AddIndexToSkill < ActiveRecord::Migration[7.0]
  def change

    add_index :users, :role_id
  end
end
