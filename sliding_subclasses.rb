require_relative 'sliding_pieces'

class Rook < SlidingPiece

  MOVE_DIRECTIONS = [
    [ 0,  1],
    [ 1,  0],
    [-1,  0],
    [ 0, -1]
  ]

  def to_s
    ' ♖  '.colorize(@color)
  end

  def move_dirs
    MOVE_DIRECTIONS
  end

  def dup
    Rook.new(@pos, @color, nil)
  end
end

class Bishop < SlidingPiece

  MOVE_DIRECTIONS = [
    [ 1, 1],
    [ 1,-1],
    [-1,-1],
    [-1, 1]
  ]

  def to_s
    ' ♗  '.colorize(@color)
  end

  def move_dirs
    MOVE_DIRECTIONS
  end

  def dup
    Bishop.new(@pos, @color, nil)
  end

end

class Queen < SlidingPiece

  MOVE_DIRECTIONS = [
    [ 1, 1],
    [ 1,-1],
    [-1,-1],
    [-1, 1],
    [ 0, 1],
    [ 1, 0],
    [-1, 0],
    [ 0,-1]
  ]

  def to_s
    ' ♕  '.colorize(@color)
  end

  def move_dirs
    MOVE_DIRECTIONS
  end

  def dup
    Queen.new(@pos, @color, nil)
  end

end
