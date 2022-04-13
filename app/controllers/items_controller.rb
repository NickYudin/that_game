class ItemsController < ApplicationController

  before_action :set_weapon, only: %i[ use_weapon ]
  
  def use_weapon
    @item.inactive? ? @item.use : @item.hide
    @item.save
  end

  def use_armour; end

  private

  def set_weapon
    @item = character.items.find_by(weapon_id: params[:weapon_id])
  end
end
