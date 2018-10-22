class Tile
  class PositiveTile < Tile
    def initialize(id, board, link_id)
      super
      @id = id
      @type = "positive"
    end
  end
end
