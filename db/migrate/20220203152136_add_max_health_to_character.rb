class AddMaxHealthToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :max_health, :integer, default: 0
  end
end
