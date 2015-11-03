require_relative "board"
require_relative "player"
require 'colorize'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @players = [Player.new(@board, 'Stephen', :white),
      Player.new(@board, 'Jeff', :red)]
  end

  def run
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    until @board.checkmate?(:white) || @board.checkmate?(:red)
      begin
        current_player = @players.first
        puts "#{current_player.name} (#{current_player.color} player's) turn"
        puts "Select a piece"
        start = current_player.move
        raise NoPieceError, 'empty space' if @board[start].nil?

        raise InvalidMoveError, "wrong color" unless @board[start].color == current_player.color
        puts "Select a square to move the piece"
        end_pos = current_player.move

        @board.move(start, end_pos)


        # puts "#{:white.to_s} is in check" if @board.in_check?(:white)
        # puts "#{:white.to_s} is in checkmate" if @board.checkmate?(:white)

      rescue InvalidMoveError => e
        puts e.message
        retry
      rescue NoPieceError => e
        puts e.message
        retry
      end

      @players.rotate!
    end

    puts "#{@players.last.color.capitalize} wins!"
  end
end




if __FILE__ == $PROGRAM_NAME
  game = Game.new.run
  # game.board.board = Array.new(8) {Array.new(8) {nil} }
  # game.board[[5,5]] = Rook.new([5,5], :red, game.board)
  # game.board[[1,7]] = Rook.new([1,7], :red, game.board)
  # game.board[[0,0]] = King.new([0,0], :white, game.board)
  #
  # game.run
end
