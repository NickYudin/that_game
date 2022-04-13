class Character < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :char_class
  belongs_to :race
  belongs_to :ability_table, dependent: :destroy
  has_one :barbarian_status
  has_many :items
  has_many :weapons, through: :items

  has_one_attached :avatar

  validates :name, :level, :health, :experiense, presence: true

  after_save :level_up

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

  def features
    public_send("#{char_class.name}Feature")
  end

  def level_up
    @level = level
    if experiense >= ExperienceRequirement.find_by(level: (@level + 1))[:experience]
      @level += 1
      update(level: @level)
      ChatMessage.call("Level up! Now you are at #{@level} level!")
      update_features
    end
  end

  def update_features
    b = BarbarianFeature.find_by(level: level) #need to correct method for all classes
    hh = { max_rages: b.rages, rage_damage: b.rage_damage, proficiency_bonus: b.proficiency_bonus}
    status.update(hh)
    status.set_default
  end
end
