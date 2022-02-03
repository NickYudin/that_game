class AddLvlDefaulr < ActiveRecord::Migration[7.0]
  def change
    change_column_default :characters, :level, from: 0, to: 1
  end
end
