class Board < ApplicationRecord
  belongs_to :game

  def get_tile_set
    tiles = []

    Tiles.all.each do |t|

      case t.tile_type
      when "none"
        tiles << Tile.new(t.id, self)
      when "positive"
        tiles << Tile::PositiveTile.new(t.id, self)
      when "negative"
        tiles << Tile::NegativeTile.new(t.id, self)
      else
        tiles << Tile.new(t.id, self)
      end
    end
    tiles
  end
end
