class CreateAbilityTables < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_tables do |t|
      t.integer :character_id, null: false

      t.integer :strength, default: 10
      t.integer :dexterity, default: 10
      t.integer :constitution, default: 10
      t.integer :intelligence, default: 10
      t.integer :wisdom, default: 10
      t.integer :charisma, default: 10
      t.timestamps
    end
  end
end
