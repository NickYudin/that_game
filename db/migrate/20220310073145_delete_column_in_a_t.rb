class DeleteColumnInAT < ActiveRecord::Migration[7.0]
  change_table :ability_tables do |t|
    t.remove :character_id
    
  end
end
