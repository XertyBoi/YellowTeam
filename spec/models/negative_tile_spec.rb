require 'rails_helper'

RSpec.describe Tile::NegativeTile, type: :model do

  it "tests we can create an instance of Negative Tile" do
    tile = Tile::NegativeTile.new
    expect(tile.class).to eq(Tile::NegativeTile)
  end

  it "tests we can call perform method on Negative Tile" do
    tile = Tile::NegativeTile.new
    expect(tile.perform).to eq(true)
  end

end
