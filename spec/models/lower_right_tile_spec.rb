require 'rails_helper'

RSpec.describe Tile::LowerRightTile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1,tile_set: 'default')
    @tile = Tile::LowerRightTile.new(1 , 1, @board )
  end

  it "tests we can create an instance of Negative Tile" do
    expect(@tile.class).to eq(Tile::LowerRightTile)
  end
end
