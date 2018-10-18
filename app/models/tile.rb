class Tile

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def draw(position_id)
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
