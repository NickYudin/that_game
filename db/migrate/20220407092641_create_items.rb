class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :character
      t.belongs_to :weapon
      t.integer :durability, default: 100
      t.timestamps
    end
  end
end
