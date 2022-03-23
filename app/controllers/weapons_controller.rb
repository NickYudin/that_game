class WeaponsController < ApplicationController
  def index
    @q = Weapon.ransack(params[:q])
    @weapons = @q.result.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "weapons", formats: [html]), pagination: view_context.will_paginate(@weapons) }
      }
    end
  end
end
