class HitIncrease < ApplicationService
  #sets up basic value of HP in feture will be used for "short rest" and "full rest"
  def initialize(character)
    @character = character
    @level = character.level
    @class = CharClass.find(character.char_class_id)
  end

  def call
    if @level = 1
      @class.hit_dice.face  + Modificator.call(@character.ability_table.constitution)
    else
      healing_surge
    end
  end

  def healing_surge
    DiceRoller.call(1, @class.hit_dice.face) + Modificator.call(@character.ability_table.constitution)
  end

end
