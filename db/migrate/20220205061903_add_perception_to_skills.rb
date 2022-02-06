class AddPerceptionToSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :skills, :perception, :integer, default: 10
  end
end
