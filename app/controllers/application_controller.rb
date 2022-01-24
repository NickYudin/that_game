class ApplicationController < ActionController::Base

helper_method :next_room

  def next_room
  	@room.restore!
  	Room.all.sample
  end

end
