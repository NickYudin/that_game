class EpicBattle < ApplicationService
  def initialize(character, monster, room)
    @character = character
    @monster = monster
    @room = room
    @chat = Chat.first.id
  end

  def call
    order
    round(@first_fighter, @second_fighter)
    round(@second_fighter, @first_fighter)
  end

  # generates array of fighters ordered by initiative.
  # When two initiative are equal, the order of the
  # corresponding elements is unpredictable (what we correctly need).
  def order
    order = initiative
    @first_fighter = order.first[:fighter]
    @second_fighter = order.last[:fighter]
  end

  def check
    if @room.in_action? && @character.alive?
      if @character.health < 1

        @content = "#{@character.name} are fall down by #{@monster.name}'s hand..."
        message
        @room.monster_wins!
        @character.death!

      elsif @monster.health < 1

        @content = "#{@monster.name.capitalize} fall down by your hand!"
        message
        @room.character_wins!
        @character.experiense += (@monster.power * 3)

      elsif @monster.health < 1 && @character.health < 1

        @content = 'Both of you fall dawn...'
        message
        @room.monster_wins!

      end
    end
  end

  def round(fighter, opponent)
    # check for alive fighter:
    if fighter.health > 0
      # hitting and corresponding message creating:
      @content = "#{fighter.name} strikes! And #{try_to_hit(fighter, opponent)}"
      message
      check
    end
  end

  def try_to_hit(fighter, opponent)
    if DiceRoller.call(1, 20) + initiative_modificator(fighter) > armour_class(opponent)
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

  # creates array of sorted (desc) hashes to determine order of strikes in current fight
  def initiative
    initiative = [
      { fighter: @character, initiative: initiative_of(@character) },
      { fighter: @monster, initiative: initiative_of(@monster) }
    ].sort_by { |fighter| fighter[:initiative] }.reverse!
  end

  def dmg(fighter)
    # in feauture with weapon type and dealing damage accouning:
    @dmg = DiceRoller.call(1, 4)
    @dmg += Rage.call(@character) if fighter == @character && @character.char_class.name == 'Barbarian'
    @dmg
  end

  def initiative_of(fighter)
    DiceRoller.call(1, 20) + initiative_modificator(fighter)
  end

  def initiative_modificator(fighter)
    Modificator.call(fighter.ability_table.dexterity)
  end

  def message
    ChatMessage.call(@chat, @content)
  end
end
