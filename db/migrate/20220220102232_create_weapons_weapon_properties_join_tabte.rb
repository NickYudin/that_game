class CreateWeaponsWeaponPropertiesJoinTabte < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons_weapon_properties, id: false  do |t|

      t.bigint :weapon_id
      t.bigint :weapon_property_id
    end

    add_index :weapons_weapon_properties, :weapon_id
    add_index :weapons_weapon_properties, :weapon_property_id
  end
end