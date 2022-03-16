class Rage < ApplicationService

  def initialize(character)
    @status = character.barbarian_status
  end

  def call
    if @status.rage_active?
      @status.toggle!(:rage_active)
      return @status.rage_damage
    else
      0
    end
  end
end
