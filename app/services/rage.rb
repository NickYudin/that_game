class Rage < ApplicationService
  def initialize(character)
    @character = character
    @status = @character.status
  end

  def call
    if @status.rage_active?
      @status.toggle!(:rage_active)
      @status.rage_damage
    else
      0
    end
  end
end
