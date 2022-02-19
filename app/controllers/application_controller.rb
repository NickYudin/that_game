class ApplicationController < ActionController::Base

  before_action :authenticate_user!, :character_exist?

  helper_method :next_room, :character_exist?

  #generate next room for user
  def next_room
  	Room.all.sample
  end

  #check if user created a character yet
  def character_exist?
    if current_user
      current_user.character != nil
    end
  end

  #cathing the exeption from cancancan
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  # creates table Skill for current character
  def set_skills(at)
    Skill.create!(ability_table_id: at.id) if at.skill.nil?
    BasicAttribute.call(at)
  end

end
