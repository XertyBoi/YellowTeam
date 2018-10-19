class Tile
  class PositiveTile < Tile
    def perform
      @board.position_id +=5
      super
    end

    def draw
    if id == @board.position_id
      perform 	
      "{0}"
    else
      "{ }"
    end
  end

  end
end
