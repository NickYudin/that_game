class AddColumnToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :health, :integer, default: 7
  end
end
