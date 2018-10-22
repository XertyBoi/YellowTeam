class Tile
  class PositiveTile < Tile
    def initialize(id, board, link_id)
      super
       @type = "positive"
    end
  end
end
