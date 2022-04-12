class CreateExperienceRequirements < ActiveRecord::Migration[7.0]
  def change
    create_table :experience_requirements do |t|
      t.integer :level
      t.integer :experience
      t.integer :proficiency_bonus

      t.timestamps
    end
  end
end
