class Tile
  class PositiveTile < Tile

    def initialize(id, board)
      super
      @id = id
      @type = "positive"
    end

    def perform
      @board.position_id += 5
      super
    end
  end
end
