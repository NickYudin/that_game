class BarbarianStatus < ApplicationRecord
  belongs_to :character, dependent: :destroy

  def set_default
    self.current_rages = max_rages
    self.rage_active = false
    save!
  end
end
