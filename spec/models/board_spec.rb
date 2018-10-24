require 'rails_helper'

RSpec.describe Board, type: :model do
  before(:each) do
    @game = Game.new(id: 2, name: "test_game")
    @board = Board.new(id: 1, game_id: 2)
  end

  it "finds a board associated with a game" do
    expect(@board.game_id).to eq(@game.id)
  end

  it "creates a tile set associated with the board" do
    Tiles.create(id: 1, tile_type: 'none', link_id: 0)
    Tiles.create(id: 2, tile_type: 'none', link_id: 0)

    expect(@board.get_tile_set.first.id).to eq(1)
  end

  it "creates a normal tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'none', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile)
  end

  it "creates a positive tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'positive', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile::PositiveTile)
  end

  it "creates a negative tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'negative', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile::NegativeTile)
  end

  it "creates a lower right corner tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'lrc', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile::LowerRightTile)
  end

  it "creates a upper right corner tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'urc', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile::UpperRightTile)
  end

  it "creates a lower left corner tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'llc', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile::LowerLeftTile)
  end

  it "creates a upper left corner tile type based on stored tiles" do
    Tiles.create(id: 1, tile_type: 'ulc', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile::UpperLeftTile)
  end

  it "creates a normal tile type if no type specified" do
    Tiles.create(id: 1, tile_type: '', link_id: 0)
    expect(@board.get_tile_set[0].class).to eq(Tile)
  end
end
