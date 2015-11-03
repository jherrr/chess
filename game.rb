require_relative "board"
require_relative "player"


class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    until false
      puts "Select a piece"
      start = @player.move
      puts "Select a square to move the piece"
      end_pos = @player.move
      @board.move(start, end_pos)

    end
    puts "Hooray, the board is filled!"
  end
end




if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
