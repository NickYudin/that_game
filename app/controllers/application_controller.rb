class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :next_room, :character_exist?

  #generate next room for user
  def next_room
  	Room.all.sample
  end

  #check if user created a character yet
  def character_exist?
      current_user.character != nil
  end

end
