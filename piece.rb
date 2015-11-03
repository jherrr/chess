

class Piece

  attr_accessor :pos, :board, :color
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def valid_moves
    # debugger
    available_moves = []
    self.moves.each do |move|
      temp_board = @board.dup
      # p @board[@pos].class
      # puts "this is the temp:"
      # p temp_board[@pos].class
      temp_board.move!(@pos, move)
      # p "can you see me?"
      unless temp_board.in_check?(@color)
        available_moves << move
      end
    end

    available_moves
  end

end

def add_pos(pos, dpos)
  x, y = pos
  dx, dy = dpos
  [x + dx, y + dy]
end
