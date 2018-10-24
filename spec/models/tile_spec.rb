require 'rails_helper'

RSpec.describe Tile, type: :model do
   before :each do
    @board = Board.new(id: 1, game_id: 1,tile_set: 'default')
    @tile = Tile.new(5 , @board, 1 )
    @user = User.new(uuid: 10011, game_id: 1, nickname: "test", position_id: 17)
  end

	it "expects new instance of tile exists" do
	  expect(@tile.nil?).to eq false
	end

	it "expects perform method to not to return nil" do
      @tile.perform(@user)
	  expect(@user.position_id.nil?).to eq false
	end

	it "expects has_counter method is not returning nil" do
	  @tile = Tile.new(17 , @board, 1 )
	  expect(@tile.has_counter?(@user)).to eq true
	end
  
end
