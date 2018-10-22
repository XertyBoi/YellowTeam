class Tile
  class NegativeTile < Tile
    def initialize(id, board, link_id)
      super
      @type = "negative"
    end
  end
end
