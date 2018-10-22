require 'rails_helper'

RSpec.describe Tile::PositiveTile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1, position_id: 1, tile_set: 'default')
    @tile = Tile::PositiveTile.new(1 , @board )
  end

  it "tests we can create an instance of PositiveTile" do
    expect(@tile.class).to eq(Tile::PositiveTile)
  end

  it "tests we can call perform method on PositiveTile" do
    expect(@tile.perform).to eq(true)
  end

  it "perform method increases board position id" do
    @tile.perform
    expect(@board.position_id).to be > 1
  end
end
