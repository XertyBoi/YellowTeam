require 'rails_helper'

RSpec.describe Tile::UpperLeftTile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1,tile_set: 'default')
    @tile = Tile::UpperLeftTile.new(1 , @board, 1 )
  end

  it "tests we can create an instance of UpperLeftTile Tile" do
    expect(@tile.class).to eq(Tile::UpperLeftTile)
  end

  it "tests position is correct for the first upper left tile" do
  	@tile = Tile::LowerLeftTile.new(21 , @board, 1 )
    expect(@tile.id).to eq(21)
  end

  it "tests if lower left tile has a link" do
  	@tile = Tile::LowerLeftTile.new(41 , @board, 1 )
  	expect(@tile.link).to eql 1
  end

 end 