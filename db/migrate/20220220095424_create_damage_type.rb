class CreateDamageType < ActiveRecord::Migration[7.0]
  def change
    create_table :damage_types do |t|
      t.string :name
      t.references :weapons

      t.timestamps
    end
  end
end
