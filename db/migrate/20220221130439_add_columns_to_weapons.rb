class AddColumnsToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_column :weapons, :cost, :string
    add_column :weapons, :weight, :string
  end
end
