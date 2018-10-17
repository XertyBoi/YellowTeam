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
    render :show
  end

  def set_list
    @game = Game.find(params[:id])
  end



end
