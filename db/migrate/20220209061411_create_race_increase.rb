class CreateRaceIncrease < ActiveRecord::Migration[7.0]
  def change
    create_table :race_increases do |t|
      t.integer :race_id
      t.integer :strength, default: 0
      t.integer :dexterity, default: 0
      t.integer :constitution, default: 0
      t.integer :intelligence, default: 0
      t.integer :wisdom, default: 0
      t.integer :charisma, default: 0

      t.timestamps
    end
  end
end
