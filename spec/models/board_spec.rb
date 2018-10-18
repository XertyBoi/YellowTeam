require 'rails_helper'

RSpec.describe Board, type: :model do
  it "to show that we can grab a board using the game's id" do

    @game = Game.new(id: 2, name: "test_game")
    @board = Board.new(id: 1, game_id: 2, position_id: 0)

    expect(@board.game_id).to eq(@game.id)
  end

  it "tests that board will return an array for tiles" do

        @game = Game.new(id: 2, name: "test_game")
        @board = Board.new(id: 1, game_id: 2, position_id: 0)

    expect(@board.get_tile_set).to eq(Array)
  end


  it "tests that board will contain tiles" do
    skip
    @game = Game.new(id: 2, name: "test_game")
    @board = Board.new(id: 1, game_id: 2, position_id: 0)

    expect(@board.get_tile_set[0].class).to eq(Tile)
  end

end
