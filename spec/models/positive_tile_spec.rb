require 'rails_helper'

RSpec.describe Tile::PositiveTile, type: :model do
  before :each do
    @board = Board.new(id: 1, game_id: 1,tile_set: 'default')
    @tile = Tile::PositiveTile.new(5 , @board, 1 )
    @user = User.new(uuid: 10011, game_id: 1, nickname: "test", position_id: 4)
  end

  it "tests we can create an instance of Positive Tile" do
    expect(@tile.class).to eq(Tile::PositiveTile)
  end

  it "tests perform method decreases user position id" do
  	@tile.perform(@user)
    expect(@user.position_id).to_not eq(4)
  end
end
