class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
        #Strength
      t.integer :athletics
        #Dexterity
      t.integer :acrobatics
      t.integer :sleight_of_hand
      t.integer :stealth
        #Intelligence
      t.integer :arcana
      t.integer :history
      t.integer :investigation
      t.integer :nature
      t.integer :religion
        #Wisdom
      t.integer :animal_handling
      t.integer :insight
      t.integer :medicine
        #Perception ????
      t.integer :survival
        #Charisma
      t.integer :deception
      t.integer :intimidation
      t.integer :performance
      t.integer :persuasion

      t.references :ability_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
