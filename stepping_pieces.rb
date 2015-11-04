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
    if @board.in_bounds?(current_pos)
      square_contents = @board[current_pos]
      if square_contents.nil? || square_contents.color != color
        return true
      end
    end

    false
  end
end
