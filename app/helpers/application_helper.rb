module ApplicationHelper
  def view_for_a_t
    character.ability_table.free_points > 0 ? 'ability_tables/form' : 'ability_tables/ability_table'
  end

  def delete_button   
    character.dead? ? "btn-danger shadow rounded-5 btn-lg" : "btn btn-danger shadow rounded-5 btn-sm"
  end

  # group of methods to show progress bars:
  def progress(current, needs)
    progress = current.to_f / needs * 100
    progress > 0 ? progress : 0
  end

  def exp_req
    ExperienceRequirement.find_by(level: (character.level + 1))[:experience]
  end

  def exp_progress
    progress(character.experiense, exp_req)
  end

  def hp_progress
    progress(character.health, character.max_health)
  end

  def weapon_change(weapon)
    character.items.find_by(weapon_id: weapon.id).inactive? ? "use" : "hide"
  end
end