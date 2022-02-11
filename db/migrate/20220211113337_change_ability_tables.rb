class ChangeAbilityTables < ActiveRecord::Migration[7.0]
  def change
    add_index :ability_tables, :character_id
  end
end
