class AbilityTable < ApplicationRecord

  has_one :character
  has_one :monster
  has_one :skill, dependent: :destroy

end
