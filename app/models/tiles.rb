class Tiles < ApplicationRecord
  def test
    tiles = []

    Tiles.all.each do |t|
      tiles << Tile.new(t.id)
    end

    tiles
  end
end
