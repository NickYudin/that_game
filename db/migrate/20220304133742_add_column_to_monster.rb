class AddColumnToMonster < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :max_health, :integer, default: 10
  end
end
