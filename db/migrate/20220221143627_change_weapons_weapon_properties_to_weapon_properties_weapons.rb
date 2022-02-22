class ChangeWeaponsWeaponPropertiesToWeaponPropertiesWeapons < ActiveRecord::Migration[7.0]
  def change
    remove_index :weapons_weapon_properties, :weapon_property_id
    rename_table :weapons_weapon_properties, :weapon_properties_weapons
    add_index :weapon_properties_weapons, :weapon_property_id

  end
end
