class GamesController < ApplicationController
  before_action :set_vars, only: [:show, :destroy, :update, :end_turn]

  def index
    @games = Game.all
    if (has_user?)
      user = User.find_by uuid: @user_id
      @game = Game.find_by id: user.game_id
      log("#{user.nickname} has left the game!")
      user.destroy
    end
  end

  def has_user?
    User.exists?(uuid: cookies[:user_id])
  end

  def show
    check_for_end
  end

  def complete
  end

  def check_for_end
    @users_in_game.each do |user|
      end_game if user.position_id == 100
    end
  end

  def add_user_to_game
    if User.exists?(uuid: @user_id)
      @user = User.find_by uuid: @user_id
    else
      if (User.where game_id: @game.id).size < 4
      @user = User.create(uuid: @user_id, game_id: @game.id, nickname: "Player#{@user_id}", position_id: 1)
      log("#{@user.nickname} has joined the game!")
      end
    end
  end

  def log(msg)

    array_log = @game.log.split('£')
    array_log.shift if array_log.size == 10
    array_log << "[#{Time.now.strftime("%H:%M:%S")}] #{msg}"

    @game.log = array_log.join('£')
    @game.save
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
      redirect_to game_path(@game.id)
      return
    end

    @old_position = @current_player.position_id
    @new_position = tiles_limit(@current_player, @last_roll)
    @current_player.position_id = @new_position

    tile_landed_on = @tile_set[@current_player.position_id-1]
    tile_landed_on.perform(@current_player)
    log("#{@current_player.nickname} rolled a #{@last_roll}! [#{@old_position} to #{@new_position}]")

    if tile_landed_on.instance_of? Tile::PositiveTile
      log "#{@current_player.nickname} found a shortcut on tile #{tile_landed_on.id} to tile #{tile_landed_on.link}!"
    elsif tile_landed_on.instance_of? Tile::NegativeTile
      log "#{@current_player.nickname} fell through a hole in the tracks on tile #{tile_landed_on.id} and landed on tile #{tile_landed_on.link}!"
    end

    @current_player.save
    end_turn if @current_player.position_id != 100
    redirect_to game_path(@game.id)
  end

  def end_turn
    if (@users_in_game[@game.turn_id + 1].nil?)
      @game.turn_id = 0
    else
      @game.turn_id += 1
    end

    @game.save
  end

  def tiles_limit(player, increment)
    new_position = player.position_id += increment
    if player.position_id > 100
      new_position = 100 - (new_position - 100)
    elsif player.position_id < 1
      new_position = 1
    else
      new_position
    end
    new_position
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
    @users_in_game.each{|user| user.update(position_id: 1)}
    @game.log = ""
    @game.save
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully reset.' }
      format.json { head :no_content }
    end
  end

  def game_params
    params.require(:game).permit(:name, :turn_id, :log)
  end

  def set_vars
    begin
      @game = Game.find(params[:id])
    rescue
      render :complete
      return
    end

    @board = @game.board
    @tile_set = @board.get_tile_set
    add_user_to_game
    @users_in_game = User.where game_id: @game.id
    @current_player = @users_in_game[@game.turn_id]

    @current_player = @users_in_game.first if @current_player.nil?
  end

  def delete
    @users_in_game.each { |u| u.destroy }
    @board.destroy
    @game.destroy
  end

  private

  def end_game
    @winner = @current_player.nickname
    render :complete
  end
end
