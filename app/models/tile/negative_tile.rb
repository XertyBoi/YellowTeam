class Tile
  class NegativeTile < Tile

    def initialize(id, board)
      super
      @type = "negative"
    end

    def perform
      @board.position_id -= 3
      super
    end
  end
end
