require_relative 'stepping_pieces'

class Knight < SteppingPieces
  MOVE_DIRECTIONS = [
    [ 1,  2],
    [ 1, -2],
    [ 2,  1],
    [ 2, -1],
    [-1, -2],
    [-1,  2],
    [-2,  1],
    [-2, -1]
  ]

  def to_s
    ' ♘  '.colorize(@color)
  end

  def move_dirs
    MOVE_DIRECTIONS
  end

  def dup
    Knight.new(@pos, @color, nil)
  end
end


class King < SteppingPieces
  MOVE_DIRECTIONS = [
    [ 1,  1],
    [ 1, -1],
    [-1, -1],
    [-1,  1],
    [ 0,  1],
    [ 1,  0],
    [-1,  0],
    [ 0, -1]
  ]

  def to_s
    ' ♔  '.colorize(@color)
  end

  def move_dirs
    MOVE_DIRECTIONS
  end

  def dup
    King.new(@pos, @color, nil)
  end
end
