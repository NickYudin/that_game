class AbilityTablesController < ApplicationController
  before_action :set_ability_table, only: %i[update add_point add_free_points]
  before_action :set_character, only: %i[create update add_point]

  def new
    @ability_table = AbilityTable.new
  end

  # POST /ability_table or /ability_table.json
  def create
    @ability_table = AbilityTable.new(ability_table_params)

    respond_to do |format|
      if @ability_table.save
        format.html { redirect_to character_url(@character) }
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
        format.html { redirect_to character_url(@character), notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # adds point to selected ability by using corresponding button in front-end
  def add_point
    @ability_table.free_points -= 1
    @ability_table.update!(params.permit(
                             :strength,
                                        :dexterity,
                                        :constitution,
                                        :intelligence,
                                        :wisdom,
                                        :charisma
                           ))
    # set_skills based in application_controller:
    set_skills(@ability_table)
    Health.call(@character) if @character.ability_table.free_points == 0
    redirect_to @character
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ability_table
    @ability_table = AbilityTable.find(params[:id])
  end

  # setting character for redirecting after commit
  def set_character
    @character = current_user.character
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
