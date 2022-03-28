class Character < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :char_class
  belongs_to :race
  belongs_to :ability_table, dependent: :destroy
  has_one :barbarian_status
  after_save :level_up

  has_one_attached :avatar

  validates :name, :level, :health, :experiense, presence: true

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

  def status
    public_send("#{char_class.name.downcase}_status")
  end

  def level_up
    @level = level
    if experiense >= ExperienceRequirement.find_by(level: (@level + 1))[:experience]
      @level += 1
      update(level: @level)
    end
  end
end
