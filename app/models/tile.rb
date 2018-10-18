class Tile

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def draw
    "[ ]"
  end

  def perform
  	true
  end
end
