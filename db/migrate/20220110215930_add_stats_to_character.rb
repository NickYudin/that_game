class AddStatsToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :health, :integer
    add_column :characters, :experiense, :integer
  end
end
