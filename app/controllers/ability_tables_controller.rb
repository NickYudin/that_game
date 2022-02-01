class AbilityTablesController < ApplicationController

  before_action :set_ability_table, only: %i[ update ]

  def new
    @ability_table = AbilityTable.new
  end

  # POST /ability_table or /ability_table.json
  def create
    @ability_table = AbilityTable.new(ability_table_params)

    respond_to do |format|
      if @ability_table.save
        BasicAttribute.call(@ability_table)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ability_table.update(ability_table_params)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # # Use callbacks to share common setup or constraints between actions.
  def set_ability_table
    @character = current_user.character
    @ability_table = AbilityTable.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ability_table_params
    params.require(:ability_table).permit(
                                        :character_id,
                                        :strength,
                                        :dexterity,
                                        :constitution,
                                        :intelligence,
                                        :wisdom,
                                        :charisma
                                        )
  end
end
