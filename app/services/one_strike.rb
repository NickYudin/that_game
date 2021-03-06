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
    if fighter.instance_of?(Character.first.class)
      @dmg =  weapon_damage(fighter) 
      @dmg += Rage.call(fighter) if (fighter.char_class.name == 'Barbarian')
    end
    @dmg || DiceRoller.call(1, 4) 
  end

  def weapon_damage(fighter)
    damage = Weapon.find(fighter.items.active_weapon.first.weapon_id).damage.split('d') 
    DiceRoller.call(damage[0].to_i, damage[1].to_i) + fighter.status.proficiency_bonus
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
