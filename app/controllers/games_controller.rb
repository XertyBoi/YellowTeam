class GamesController < ApplicationController
  before_action :set_vars, only: [:show,:destroy,:update, :end_turn]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @last_roll = 0
  end

  def add_user_to_game
    if User.exists?(uuid: @user_id)
      @user = User.find_by uuid: @user_id
    else
      @user = User.create(uuid: @user_id, game_id: @game.id, nickname: "Player#{@user_id}", position_id: 0)
    end
  end

  def update_roll
    @last_roll = Dice.new.roll
    @game = Game.find(params[:game_id])
    @board = @game.board
    @tile_set = @board.get_tile_set
    @users_in_game = User.where game_id: @game.id
    @current_player = @users_in_game[@game.turn_id]

    add_user_to_game

    if @current_player != @user
      render :show
      return
    end

    @current_player.position_id += @last_roll

    tiles_limit
    @tile_set[@current_player.position_id].perform(@current_player)
    @current_player.save
    if @current_player.position_id >= 99
      end_game
    else
     end_turn
     render :show
    end
  end

  def end_turn
    if (@users_in_game[@game.turn_id + 1].nil?)
      @game.turn_id = 0
    else
      @game.turn_id += 1
    end

    @game.save
  end

  def tiles_limit
    if @current_player.position_id > 99
      @current_player.position_id = 99
    elsif @current_player.position_id < 0
      @current_player.position_id = 0
    else
      @current_player.position_id
    end
  end

  def new
    @game = Game.new
  end

  def destroy
    delete
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully removed.' }
      format.json { head :no_content }
    end
  end

  def create
    @game = Game.create(game_params)
    @board = Board.create(game_id: @game.id, tile_set: "default")

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { redirect_to :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @users_in_game.each{|user| user.update(position_id: 0)}
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully reset.' }
      format.json { head :no_content }
    end
  end

  def game_params
    params.require(:game).permit(:name, :turn_id)
  end

  def set_vars
    @game = Game.find(params[:id])
    @board = @game.board
    @tile_set = @board.get_tile_set
    @users_in_game = User.where game_id: @game.id
    add_user_to_game
    @current_player = @users_in_game[@game.turn_id]
  end

  def delete
    @users_in_game.each { |u| u.destroy }
    @board.destroy
    @game.destroy
  end

  private

  def end_game
    render :complete
    delete
  end
end
