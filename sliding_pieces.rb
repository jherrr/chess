require_relative 'piece'

class SlidingPiece < Piece

  def moves
    available_moves = []

    starting_pos = pos
    move_directions = move_dirs
    move_directions.each do |dir|
      x, y = starting_pos
      dx, dy = dir
      new_pos = [x + dx, y + dy]
      current_pos = new_pos

      while move_valid?(current_pos)
        available_moves << current_pos
        unless @board[current_pos].nil?
          if @board[current_pos].color != color
            break
          end
        end

        current_pos = add_pos(current_pos, dir)
      end

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
