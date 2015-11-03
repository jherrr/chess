

class Piece

  attr_accessor :pos, :board, :color
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def move_dirs
    MOVE_DIRECTIONS
  end


  def valid_moves
    temp_board = @board.dup
  end

end

def add_pos(pos, dpos)
  x, y = pos
  dx, dy = dpos
  [x + dx, y + dy]
end
