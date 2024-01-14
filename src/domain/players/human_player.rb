class HumanPlayer
  attr_reader :color, :pieces

  def initialize(color, name, pieces)
    @color = color
    @name = name
    @pieces = pieces
  end
end
