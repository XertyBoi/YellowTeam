require 'rails_helper'

RSpec.describe Tile, type: :model do

  before :each do
    @board = Board.new(id: 1, game_id: 1, position_id: 1, tile_set: 'default')
    @tile = Tile.new(1 , @board )
  end

  it "expects new instance of tile exists" do
    expect(@tile.nil?).to eq false
  end

  it "expects perform method to return true" do
    expect(@tile.perform).to eq true
  end
end
