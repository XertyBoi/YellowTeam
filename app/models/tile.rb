class Tile
  attr_reader :id, :type, :link, :board

  def initialize(id, board, link_id)
    @id = id
    @link = link_id
    @board = board
    @type = "normal"
  end

  def has_counter?(user)
    @id == user.position_id
  end

  def perform(user)
    if @link > 0
      user.position_id = @link
    end
  end
end
