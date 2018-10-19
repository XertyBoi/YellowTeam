class Tile
  class PositiveTile < Tile

    def initialize(id, board)
      super
      @type = "positive"
    end

    def perform
      @board.position_id += 5
      super
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
