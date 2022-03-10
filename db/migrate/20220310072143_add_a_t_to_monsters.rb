class AddATToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :ability_table_id, :bigint
    add_index :monsters, :ability_table_id 
  end
end
