class GamesController < ApplicationController
  before_action :set_vars, only: [:show]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @last_roll = 0
  end

  def update_roll
    @last_roll = Dice.new.roll
    @game = Game.find(params[:game_id])
    @board = @game.board
    @tile_set = @board.get_tile_set

    @board.position_id += @last_roll
    @board.save
    if @board.position_id >= 100
      end_game
    else
     render :show
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    @board = Board.create(game_id: @game.id, position_id: 0, tile_set: "default")

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

  def game_params
    params.require(:game).permit(:name)
  end

  def set_vars
    @game = Game.find(params[:id])
    @board = @game.board
    @tile_set = @board.get_tile_set
  end

  def delete
    @game.destroy
    @board.destroy
  end

private

  def end_game
    render :complete
    delete
  end
end
