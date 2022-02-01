class AbilityTable < ApplicationRecord

belongs_to :character
has_one :skill, dependent: :destroy

end
