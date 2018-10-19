require 'rails_helper'

RSpec.describe Tile::NegativeTile, type: :model do

  it "tests we can create an instance of Negative Tile" do
    tile = Tile::NegativeTile.new 1
    expect(tile.class).to eq(Tile::NegativeTile)
  end

  it "tests we can call perform method on Negative Tile" do
    tile = Tile::NegativeTile.new 1
    expect(tile.perform).to eq(true)
  end

  it "tests draw method returns output different then normal" do
    tile = Tile::NegativeTile.new 1
    expect(tile.draw 2).to eq('( )')
  end

end
