class Tile
  class UpperLeftTile < Tile
    def initialize(id, board, link_id)
      super
      @type = "ulc"
    end
  end
end
