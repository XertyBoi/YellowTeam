class Tile
  class UpperRightTile < Tile
    def initialize(id, board, link_id)
      super
      @type = "urc"
    end
  end
end
