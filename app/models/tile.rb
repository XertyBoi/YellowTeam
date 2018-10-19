class Tile

  attr_reader :id

  def initialize(id, board)
    @id = id
    @board = board
  end

  def draw
    if id == position_id
      "[0]"
    else
      "[ ]"
    end
  end

  def perform
  	true
  end
end
