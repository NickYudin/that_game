class CreateBarbarianStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :barbarian_statuses do |t|
      t.integer :max_rages, default: 2
      t.integer :current_rages, default: 2
      t.integer :rage_damage, default: 2
      t.boolean :rage_active, defaulf: false
      t.bigint :character_id

      t.timestamps
    end
    add_index :barbarian_statuses, :characters_id
  end
end
