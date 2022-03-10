class Room < ApplicationRecord
  include AASM

  belongs_to :monster
  validates :description, presence: true

  aasm do
    state :monster_in, initial: true
    state :in_action
    state :monster_defeated

    event :fighting do
      transitions from: :monster_in, to: :in_action
    end

    event :monster_wins do
      transitions from: :in_action, to: :monster_in
    end

    event :character_wins do
      transitions from: :in_action, to: :monster_defeated
    end

    event :restore do
      transitions from: :monster_defeated, to: :monster_in
    end
  end
end
