class Tile
  class LowerLeftTile < Tile
    def initialize(id, board, link_id)
      super
      @type = "llc"
    end
  end
end
