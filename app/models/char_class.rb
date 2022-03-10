class CharClass < ApplicationRecord
  belongs_to :hit_dice
  has_many :characters
end
