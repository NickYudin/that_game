class CharactersController < ApplicationController
  load_and_authorize_resource
  before_action :set_character, only: %i[show edit update destroy set_stats set_abilities class_status]

  # GET /characters or /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1 or /characters/1.json
  def show; end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)
    @character.ability_table = AbilityTable.create
    respond_to do |format|
      if @character.save
        set_abilities
        format.html { redirect_to character_url(@character), notice: 'Character was successfully created! Now you need to set your abilities.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity, alert: @character.errors.full_messages.to_s }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to character_url(@character), notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_name
    @character = Character.find(params[:character_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(
      :name, :level, :health, :experiense, :user_id, :char_class_id, :max_health, :race_id, :avatar
    )
  end

  def set_abilities
    at = @character.ability_table
    set_skills(at)
    race_update(at, @character)
    class_status
  end

  # update ability_table with chosen racial peculiarities
  def race_update(at, char)
    increase = char.race.race_increase
    # future task: create separate method to do this more clearly:
    at.update(
      strength: at.strength + increase.strength,
          dexterity: at.dexterity + increase.dexterity,
          constitution: at.constitution + increase.constitution,
          intelligence: at.intelligence + increase.intelligence,
          wisdom: at.wisdom + increase.wisdom,
          charisma: at.charisma + increase.charisma
    )
    if at.character.race.name == 'Half-Elf'
      at.free_points += 2
      at.save
    end
  end

  def class_status
    BarbarianStatus.create(character_id: @character.id) if @character.char_class.name == 'Barbarian'
  end
end
