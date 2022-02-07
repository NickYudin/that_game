class AddFreePoints < ActiveRecord::Migration[7.0]
  def change
    add_column :ability_tables, :free_points, :integer, default: 10
  end
end
