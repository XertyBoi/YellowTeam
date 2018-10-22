class Tile
  class PositiveTile < Tile

    def initialize(id, board, link_id)
      super
      @type = "positive"
    end

    
    def draw
      if id == @board.position_id
        "{0}"
      else
        "{ }"
      end
    end
  end
end
