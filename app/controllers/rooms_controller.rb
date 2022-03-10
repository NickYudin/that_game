class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy fight restore ]
  before_action :restore, only: :show
  before_action :set_fighters, only: :fight

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
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
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
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
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
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fight
    @room.fighting! if @room.monster_in?
    EpicBattle.call(@character, @monster, @room)
    if @character.save && @room.save
      redirect_to @room
    end
    
  end

  def strike

  end

  def run

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_fighters
      @character = current_user.character
      @monster = @room.monster
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:description, :monster_id)
    end

    #restore monster when user enter new room
    def restore
      if !@room.monster_in? && current_user.last_room != @room.id
        monster =@room.monster
        monster.health = monster.max_health
        monster.save!
        @room.restore!
      end
    end
end
