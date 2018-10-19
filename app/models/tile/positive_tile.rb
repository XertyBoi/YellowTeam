class Tile
  class PositiveTile < Tile
    def perform
      super
    end

    def draw(position_id)
    if id == position_id
      "{0}"
    else
      "{ }"
    end
  end

  end
end
