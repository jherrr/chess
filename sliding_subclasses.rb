require_relative 'sliding_pieces'

class Rook < SlidingPiece

  MOVE_DIRECTIONS = [[0,1],[1,0],[-1,0],[0,-1]]

  def to_s
    ' R '
  end

  def move_dirs
    MOVE_DIRECTIONS
  end
end

class Bishop < SlidingPiece

  MOVE_DIRECTIONS = [[1,1],[1,-1],[-1,-1],[-1,1]]

end

class Queen < SlidingPiece

  MOVE_DIRECTIONS = [[1,1],[1,-1],[-1,-1],[-1,1],[0,1],[1,0],[-1,0],[0,-1]]

end
