class DiceRoller < ApplicationService

  # mimic usual dices (qty- number of dices, face - max value of dice)
  def initialize (qty, face)
    @qty = qty
    @face = face
  end

  def call
    result = 0
    @qty.times { result += rand(1..@face) }
    result
  end

end
