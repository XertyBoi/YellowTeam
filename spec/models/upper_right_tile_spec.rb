require 'rails_helper'

RSpec.describe Tile::UpperRightTile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1,tile_set: 'default')
    @tile = Tile::UpperRightTile.new(1, @board, 1 )

  end

  it "tests we can create an instance of UpperRightTile Tile" do
    expect(@tile.class).to eq(Tile::UpperRightTile)
  end

  it "tests position is correct for the first upper right tile" do
  	@tile = Tile::UpperRightTile.new(21, @board, 1 )
    expect(@tile.id).to eq(21)
  end

  it "tests if upper right tile has a link" do
  	@tile = Tile::UpperRightTile.new(11, @board, 1 )
  end

 end
