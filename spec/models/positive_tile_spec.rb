require 'rails_helper'

RSpec.describe Tile::PositiveTile, type: :model do

    it "tests we can create an instance of PositiveTile" do
      tile = Tile::PositiveTile.new
      expect(tile.class).to eq(Tile::PositiveTile)
    end

    it "tests we can call perform method on PositiveTile" do
      tile = Tile::PositiveTile.new
      expect(tile.perform).to eq(true)
    end
end
