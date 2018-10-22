class Tile
  attr_reader :id, :type

  def initialize(id, board, link_id)
    @id = id
    @link = link_id
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
    @board.position_id = @link if @link > 0
  end
end
