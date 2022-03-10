class Monster < ApplicationRecord
  has_many :rooms
  validates :name, :power, presence: true
  belongs_to :ability_table
end
