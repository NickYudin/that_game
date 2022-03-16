class BarbarianStatusesController < ApplicationController
  before_action :set_room
  before_action :set_character

    #barbarian method:
    def rage
      @status = @character.barbarian_status
      if @status.current_rages > 0
        @status.current_rages -= 1
        @status.toggle(:rage_active)
        @status.save! 
        @content = "You feel greate RAGE!!! Your enemies will die!!"
      else
        @content = "You feel no rage today. Need some rest..."
      end
      ChatMessage.call(Chat.first.id, @content)
      redirect_to @room
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end
  
    def set_character
      @character = current_user.character
    end
end
