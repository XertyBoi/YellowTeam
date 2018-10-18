class Board < ApplicationRecord
  belongs_to :game

  def get_tile_set
    tiles = []

    Tiles.all.each do |t|
      tiles << Tile.new(t.id)
    end

    tiles
  end

end
