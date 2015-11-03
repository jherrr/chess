require_relative 'piece'

class SteppingPieces < Piece

  def moves
    available_moves = []
    move_directions = move_dirs

    move_directions.each do |dir|
      x, y = dir
      dx, dy = pos
      new_pos = [x + dx, y + dy]
      available_moves << new_pos if move_valid?(new_pos)
    end

    available_moves
  end

  def move_valid?(current_pos)
    x, y = current_pos
    return false unless x.between?(0, 7)
    return false unless y.between?(0, 7)
    square_contents = @board[current_pos]
    return true if square_contents.nil?
    return true if square_contents.color != color

    false
  end
end
