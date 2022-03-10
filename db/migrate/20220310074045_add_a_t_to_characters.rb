class AddATToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :ability_table_id, :bigint
    add_index :characters, :ability_table_id 
  end
end
