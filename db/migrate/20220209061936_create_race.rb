class CreateRace < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :speed, default: 10
      t.string :special_rule

      t.timestamps
    end
  end
end
