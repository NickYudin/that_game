class OneStrike < ApplicationService
  def initialize(fighter, opponent)
    @fighter = fighter
    @opponent = opponent
  end

  def call
    # check for alive fighter:
    if @fighter.health > 0
      # hitting and corresponding message creating:
      content = "#{@fighter.name} strikes! And #{try_to_hit(@fighter, @opponent)}"
      ChatMessage.call(content)
      AliveCheck.call(@fighter, @opponent)
    end
  end

  private

  def try_to_hit(fighter, opponent)
    # modificator of dexterity will be replased for skill modificator of current class of character:
    if DiceRoller.call(1, 20) + Modificator.call(fighter.ability_table.dexterity) > armour_class(opponent)
      this_strike = dmg(fighter)
      opponent.health -= this_strike
      # this saves need to refresh page when damage changes fighters stats(HP for now):
      fighter.save!
      opponent.save!
      # these lines completes chat message with damage data or miss:
      "deal #{this_strike} damage!"
    else
      'miss...'
    end
  end

  def dmg(fighter)
    # in feauture with weapon type and dealing damage accouning:
    @dmg = DiceRoller.call(1, 4)
    if fighter.class == Character.first.class && fighter.char_class.name == 'Barbarian'
      @dmg += Rage.call(fighter) 
    end
    @dmg

  end

  # minimum aarmour class is 10. can be improoved
  # with putting up armours or increasing constitution
  def armour_class(fighter)
    10 + armour_modificator(fighter)
  end

  # counting armour modificator.
  # in feature will accounting puted up armours and/or schields
  def armour_modificator(fighter)
    Modificator.call(fighter.ability_table.constitution)
  end
end
