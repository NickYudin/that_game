class Monster < ApplicationRecord
  has_many :rooms
  validates_presence_of :name, :power
  belongs_to :ability_table
end
