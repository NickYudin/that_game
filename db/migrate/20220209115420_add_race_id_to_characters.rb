class AddRaceIdToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :race_id, :integer #index needed
  end
end
