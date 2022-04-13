class AddProfbonusToBarbarianStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :barbarian_statuses, :proficiency_bonus, :integer, default: 2
  end
end
