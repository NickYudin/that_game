class AddLvl < ActiveRecord::Migration[7.0]
  change_table :characters do |t|
    t.rename :power, :level
  end
end
