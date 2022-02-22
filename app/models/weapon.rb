class Weapon < ApplicationRecord

    has_and_belongs_to_many :weapon_properties

end