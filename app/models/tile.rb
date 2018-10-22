class Tile
  attr_reader :id, :type

  def initialize(id, board)
    @id = id
    @board = board
    @type = "normal"
  end

  def has_counter?
    @id == @board.position_id
  end

  def perform
  	true
  end
end
