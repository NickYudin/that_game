class Health < ApplicationService   

  def initialize(character)
    @character = character
  end

  def call
    @character.max_health += HitIncrease.call(@character)
    @character.health = @character.max_health
    @character.save!
  end

end
