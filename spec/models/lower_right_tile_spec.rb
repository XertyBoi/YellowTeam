require 'rails_helper'

RSpec.describe Tile::LowerRightTile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1,tile_set: 'default')
    @tile = Tile::LowerRightTile.new(1 , @board, 1 )
  end

  it "tests we can create an instance of LowerRightTile Tile" do
    expect(@tile.class).to eq(Tile::LowerRightTile)
  end

  it "tests position is correct for the first lower right tile" do
  	@tile = Tile::LowerRightTile.new(10 , @board, 1 )
    expect(@tile.id).to eq(10)
  end

  it "tests that lower right tile has a link" do
  	@tile = Tile::LowerRightTile.new(10 , @board, 1 )
    expect(@tile.link).to eq 1
  end     

end
