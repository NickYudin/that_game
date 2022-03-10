class ApplicationController < ActionController::Base

  before_action :authenticate_user!, unless: :devise_controller?
 # before_action :character_exist?

  helper_method :next_room, :character_exist?, :random_name, :check_avatar

  def check_avatar(character)
    begin
      url_for(character.avatar)
    rescue NoMethodError
      return  "/images/that_game_logo.jpg"
    end
  end

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

  def random_name
    @character.name || Faker::Games::ElderScrolls.first_name 
  end

end
