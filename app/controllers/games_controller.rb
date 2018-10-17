class GamesController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @games = Game.all
  end

  def show
    @last_roll = 0
  end

  def update_roll
    @last_roll = Dice.new.roll
    @game = Game.find(params[:game_id])
    @board = Board.find(@game.id)
    render :show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(test_params)
    @board = Board.new(game_id: @game.id)

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

  def set_list
    @game = Game.find(params[:id])
    @board = Board.find(@game.id)
  end
end
