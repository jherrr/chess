require_relative "display"

class Player
  attr_reader :name, :color, :display
  def initialize(board, name, color)
    @display = Display.new(board)
    @name, @color = name, color
  end

  def move
    result = nil
    until result
      result = @display.get_input
      @display.render
    end
    result
  end
end
