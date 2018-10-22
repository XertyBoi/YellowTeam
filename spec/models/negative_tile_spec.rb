require 'rails_helper'

RSpec.describe Tile::NegativeTile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1, position_id: 1, tile_set: 'default')
    @tile = Tile::NegativeTile.new(1 , @board )
  end

  it "tests we can create an instance of Negative Tile" do
    expect(@tile.class).to eq(Tile::NegativeTile)
  end

  it "tests we can call perform method on Negative Tile" do
    expect(@tile.perform).to eq(true)
  end

  it "perform method decreases board position id" do
    @tile.perform
    expect(@board.position_id).to be < 1
  end
end
