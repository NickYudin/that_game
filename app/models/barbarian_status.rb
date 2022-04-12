class BarbarianStatus < ApplicationRecord
  belongs_to :character

  def set_default
    current_rages = max_rages
    rage_active = false
    save!
  end
end
