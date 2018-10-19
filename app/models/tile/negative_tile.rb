class Tile
  class NegativeTile < Tile
    def perform
      super
    end

    def draw
      if id == @board.position_id
        "(0)"
      else
        "( )"
      end
    end
  end
end
