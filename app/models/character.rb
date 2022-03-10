class Character < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :char_class
  belongs_to :race
  belongs_to :ability_table, dependent: :destroy
  validates :name, :level, :health, :experiense, :user_id, :char_class_id, presence: true
  has_one_attached :avatar

  aasm do
    state :alive, initial: true
    state :dead

    event :death do
      transitions from: :alive, to: :dead
    end

    event :come_back do
      transitions from: :dead, to: :alive
    end
  end
end
