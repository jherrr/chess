require_relative 'piece'

class Pawn < Piece

  def initialize(pos, color, board)
    super
    @starting_pos = pos
  end

  def moves
    available_moves = []

    available_moves << (pos + [0, 1]) if move_valid?(pos + [0, 1])
    available_moves << (pos + [0, 2]) if move_valid?(pos + [0, 2]) && pos == starting_pos
    available_moves << (pos + [1, 1]) if attack_valid?(pos + [1, 1])
    available_moves << (pos + [-1, 1]) if attack_valid?(pos + [-1, 1])

    available_moves
  end

  def move_valid?(current_pos)
    x, y = current_pos
    square_contents = @board[current_pos]
    return false unless y.between?(0,7)
    return true if square_contents.nil?
    return false if square_contents.color != color

    true
  end

  def attack_valid?(current_pos)
    x, y = current_pos
    square_contents = @board[current_pos]
    return false unless x.between?(0,7)
    return false unless y.between?(0,7)
    return false if square_contents.nil?
    return true unless square_contents.color == color
  end

end
