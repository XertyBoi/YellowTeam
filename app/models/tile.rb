class Tile
  attr_reader :id, :type

  def initialize(id, board)
    @id = id
    @board = board
    @type = "normal"
  end

  def draw
    if id == @board.position_id
      "[0]"
    else
      "[ ]"
    end
  end

  def perform
  	true
  end
end
