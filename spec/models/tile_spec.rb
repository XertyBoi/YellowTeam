require 'rails_helper'

RSpec.describe Tile, type: :model do
  it "expects new instance of tile exists" do
    expect(Tile.new.nil?).to eq false
  end

  it "expects perform method to return true" do
    expect(Tile.new.perform).to eq true
  end
end
