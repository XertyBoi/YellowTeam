class Board < ApplicationRecord
  belongs_to :game

  def get_tile_set
    tiles = []

    Tiles.all.each do |t|

      case t.tile_type
      when "none"
        tiles << Tile.new(t.id)
      when "positive"
        tiles << PositiveTile.new(t.id)
      when "negative"
        tiles << NegativeTile.new(t.id)
      else
        tiles << Tile.new(t.id)
      end
    end

    tiles
  end

end
