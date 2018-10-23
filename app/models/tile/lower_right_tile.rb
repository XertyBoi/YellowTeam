class Tile
  class LowerRightTile < Tile
    def initialize(id, board, link_id)
      super
      @type = "lrc"
    end
  end
end
