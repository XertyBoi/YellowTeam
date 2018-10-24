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

  it "calls the right tile type based on tiles stored in active record" do
    Tiles.create(id: 1, tile_type: 'none', link_id: 0)
    Tiles.create(id: 2, tile_type: 'positive', link_id: 0)
    Tiles.create(id: 3, tile_type: 'negative', link_id: 0)
    Tiles.create(id: 4, tile_type: 'lrc', link_id: 0)
    Tiles.create(id: 5, tile_type: 'urc', link_id: 0)
    Tiles.create(id: 6, tile_type: 'llc', link_id: 0)
    Tiles.create(id: 7, tile_type: 'ulc', link_id: 0)
    Tiles.create(id: 8, tile_type: '', link_id: 0)

    expect(@board.get_tile_set[0].class).to eq(Tile)
    expect(@board.get_tile_set[1].class).to eq(Tile::PositiveTile)
    expect(@board.get_tile_set[2].class).to eq(Tile::NegativeTile)
    expect(@board.get_tile_set[3].class).to eq(Tile::LowerRightTile)
    expect(@board.get_tile_set[4].class).to eq(Tile::UpperRightTile)
    expect(@board.get_tile_set[5].class).to eq(Tile::LowerLeftTile)
    expect(@board.get_tile_set[6].class).to eq(Tile::UpperLeftTile)
    expect(@board.get_tile_set[7].class).to eq(Tile)
  end
end
