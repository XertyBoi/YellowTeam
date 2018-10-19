require 'rails_helper'

RSpec.describe Tile::PositiveTile, type: :model do

    it "tests we can create an instance of PositiveTile" do
      tile = Tile::PositiveTile.new 1
      expect(tile.class).to eq(Tile::PositiveTile)
    end

    it "tests we can call perform method on PositiveTile" do
      tile = Tile::PositiveTile.new 1
      expect(tile.perform).to eq(true)
    end

    it "tests draw method returns output different then normal" do
      tile = Tile::PositiveTile.new 1
      expect(tile.draw 2).to eq('{ }')
    end

    it "tests draw method returns output different then normal" do
      skip	
      tile = Tile::PositiveTile.new 1
      normal_tile = Tile.new 2
      expect(tile.draw).to eq(true)
    end
end
