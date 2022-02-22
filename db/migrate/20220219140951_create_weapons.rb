class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :damage
      t.string :damage_type_id

      t.timestamps
    end
    add_index :weapons, :damage_type_id
  end
end
