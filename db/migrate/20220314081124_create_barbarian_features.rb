class CreateBarbarianFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :barbarian_features do |t|
      t.integer :level
      t.integer :proficiency_bonus
      t.integer :rages
      t.integer :rage_damage

      t.timestamps
    end
  end
end
