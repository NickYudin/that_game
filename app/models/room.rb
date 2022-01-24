class Room < ApplicationRecord
  include AASM

  aasm do

  	state :monster_in, initial: true
    state :monster_defeated

    event :fighting do
      transitions from: :monster_in, to: :monster_defeated
    end

    event :restore do
      transitions from: :monster_defeated, to: :monster_in
    end

  end

	has_one :monster
  validates_presence_of :description
end
