class Weapon < ApplicationRecord
  belongs_to :damage_type
  has_and_belongs_to_many :weapon_properties
  has_many :items
  has_many :characters, through: :items

end
