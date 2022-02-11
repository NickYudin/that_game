class AddIndexToRaceIncrease < ActiveRecord::Migration[7.0]
  def change
    add_index :race_increases, :race_id
  end
end
