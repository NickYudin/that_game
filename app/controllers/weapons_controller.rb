class WeaponsController < ApplicationController
  def index
    @q = Weapon.ransack(params[:q])
    @weapons = @q.result.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.json do
        render json: { entries: render_to_string(partial: 'weapons', formats: [:html]), pagination: view_context.will_paginate(@weapons) }
      end
    end
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  def add_weapon
    item = Item.create(weapon_id: params[:id], character_id: character.id)
    redirect_to character if item.save
  end
end
