class EpicBattle < ApplicationService
  def initialize(character, monster)
    @character = character
    @monster = monster
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

  def round(fighter, opponent)
    OneStrike.call(fighter, opponent)
  end

  # creates array of sorted (desc) hashes to determine order of strikes in current fight
  def initiative
    initiative = [
      { fighter: @character, initiative: initiative_of(@character) },
      { fighter: @monster, initiative: initiative_of(@monster) }
    ].sort_by { |fighter| fighter[:initiative] }.reverse!
  end

  def initiative_of(fighter)
    DiceRoller.call(1, 20) + initiative_modificator(fighter)
  end

  def initiative_modificator(fighter)
    Modificator.call(fighter.ability_table.dexterity)
  end

  def message
    ChatMessage.call(@content)
  end
end
