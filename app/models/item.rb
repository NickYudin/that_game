class Item < ApplicationRecord
  include AASM

  aasm do
    state :inactive, initial: true
    state :active

    event :use do
      transitions from: :inactive, to: :active
    end

    event :hide do
      transitions from: :active, to: :inactive
    end
  end
  belongs_to :character
  belongs_to :weapon

  scope :active_weapon, -> {where(aasm_state: 'active')}
end
