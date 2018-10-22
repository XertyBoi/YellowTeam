class Board < ApplicationRecord
  belongs_to :game

  def get_tile_set
    tiles = []

    Tiles.all.each do |t|

      case t.tile_type
      when "none"
        tiles << Tile.new(t.id, self, t.link_id)
      when "positive"
        tiles << Tile::PositiveTile.new(t.id, self, t.link_id)
      when "negative"
        tiles << Tile::NegativeTile.new(t.id, self, t.link_id)
      else
        tiles << Tile.new(t.id, self, t.link_id)
      end
    end
    tiles
  end
end
