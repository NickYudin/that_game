class AliveCheck < ApplicationService
  def initialize(fighter, opponent)
    current_user = find_user(fighter, opponent) # we haven't curren_user helper in services, so using this trick
    @room = Room.find(current_user.last_room)
    @character = current_user.character
    @monster = @room.monster
  end

  def call
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

        @content = "Both of you fall dawn... But you're dead anyway."
        message
        @room.monster_wins!

      end
    end
  end

  private

  def find_user(fighter, opponent)
    fighter.instance_of?(Character.first.class) ? fighter.user : opponent.user
  end

  def message
    ChatMessage.call(@content)
  end
end
