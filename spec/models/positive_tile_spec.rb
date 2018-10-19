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

    it "tests draw method returns output different then normal" do
      @board.position_id = 2
      expect(@tile.draw).to eq('{ }')
    end

    it "tests draw method returns output different then normal" do
      expect(@tile.draw).to eq('{0}')
    end
 end
