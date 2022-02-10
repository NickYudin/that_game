class AddRaceIdToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :race_id, :integer
  end
end
