class AddColumnToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_column :weapons, :properties, :string
  end
end
