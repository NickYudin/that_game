class WeaponsController < ApplicationController

  def index
    @q = Weapon.ransack(params[:q])
    @weapons = @q.result.paginate(page: params[:page], per_page: 10)
  end

end
