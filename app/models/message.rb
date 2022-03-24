class Message < ApplicationRecord
  include AASM

  belongs_to :chat
  broadcasts_to :chat
  
  aasm do
    state :new, initial: true
    state :resent

    event :read do
      transitions from: :new, to: :resent
    end
  end

end
