class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy fight restore rest long_rest run]
  before_action :restore, only: :show
  before_action :set_character, only: %i[rest long_rest]
  before_action :set_fighters, only: %i[fight strike run]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    current_user.last_room = @room.id
    current_user.save
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit; end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # methods for in-figth buttons
  def fight
    @room.fighting! if @room.monster_in?
    EpicBattle.call(@character, @monster)
    redirect_to @room if @character.save && @room.save
  end

  def long_rest
    @character.health = @character.max_health
    @character.status.set_default
    if @character.save
      # need to setup websocket for not to receive messages twice
      ChatMessage.call('You had some food and realy good sleep. It feels like you refreshed!')
      redirect_to @room
    end
    # need to add limit for long rest (1.times/day)
  end

  def run
    ChatMessage.call("You trying to leave this fight, but #{@monster.name} not sleeps...")
    OneStrike.call(@monster, @character)
    ChatMessage.call('You ran away!') if @character.alive?
    @room.character_wins!
    redirect_to @room # in future will need some other redirect (maybe emty tunnel or smth quite place)
  end

  def rest
    @character.health = HitIncrease.call(@character)
    if @character.save
      ChatMessage.call('You feel better after some rest!')
      redirect_to @room
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  def set_fighters
    set_character
    @monster = @room.monster
  end

  def set_character
    @character = current_user.character
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:description, :monster_id)
  end

  # restore monster when user enter new room
  def restore
    if !@room.monster_in? && current_user.last_room != @room.id
      monster = @room.monster
      monster.health = monster.max_health
      monster.save!
      @room.restore!
    end
  end
end
