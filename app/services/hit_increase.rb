class HitIncrease < ApplicationService

  def initialize(character)
    @character = character
    @level = character.level
    @class = CharClass.find(character.char_class_id)
  end

  def call
    if @level = 1
      @class.hit_dice.face
    else
      healing_surge
    end
  end

  def healing_surge
    DiceRoller.call(1, @class.hit_dice.face) + Modificator.call(@character.constitution)
  end

end
