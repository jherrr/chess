require_relative "display"

class Player
  attr_reader :name, :color
  def initialize(board, name, color)
    @display = Display.new(board)
    @name, @color = name, color
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end
end
