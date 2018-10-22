class Tile
  class NegativeTile < Tile

    def initialize(id, board, link_id)
      super
      @type = "negative"
    end

    def perform
      @board.position_id = @link
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
