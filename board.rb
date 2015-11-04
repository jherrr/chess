require 'byebug'
require_relative 'stepping_subclasses'
require_relative 'sliding_subclasses'
require_relative 'pawn'

class Board

  attr_accessor :board
  def initialize
    @board = Array.new(8) {Array.new(8) {nil} }
    setup_board
  end

  def []=(position, value)
    x, y = position
    @board[x][y] = value
  end

  def [](position)
    x, y = position
    @board[x][y]
  end

  def in_bounds?(position)
    x, y = position
    x.between?(0, 7) && y.between?(0, 7)
  end

  def setup_board
    @board[0] = [
      Rook.new([0,0], :red, self),
      Knight.new([0,1], :red, self),
      Bishop.new([0,2], :red, self),
      Queen.new([0,3], :red, self),
      King.new([0,4], :red, self),
      Bishop.new([0,5], :red, self),
      Knight.new([0,6], :red, self),
      Rook.new([0,7], :red, self)
    ]
    @board[1].map!.with_index {|_, i| Pawn.new([1, i], :red, self)}
    #self[[0, 0]] = Pawn.new([0, 0], :white, self, 1)

    @board[6].map!.with_index {|_, i| Pawn.new([6, i], :white, self)}
    @board[7] = [
      Rook.new([7,0], :white, self),
      Knight.new([7,1], :white, self),
      Bishop.new([7,2], :white, self),
      Queen.new([7,3], :white, self),
      King.new([7,4], :white, self),
      Bishop.new([7,5], :white, self),
      Knight.new([7,6], :white, self),
      Rook.new([7,7], :white, self)
    ]
    # @board
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end


  def move(start, end_pos)
    #debugger
    # p self[start].class
    raise NoPieceError, "no piece" if self[start].nil?
    raise InvalidMoveError, "invalid move" unless self[start].valid_moves.include?(end_pos)
    raise InvalidMoveError, "Can't move into check" if self.in_check?(self[start].color)

    self[end_pos] = self[start]
    self[start].pos = end_pos
    self[start] = nil
  end

  def move!(start, end_pos)
    self[end_pos] = self[start]
    self[start].pos = end_pos
    self[start] = nil
  end

  def in_check?(color)

    pos = find_king(color)

    @board.each_with_index do |row, x|
      row.each_with_index do |square, y|
        next if square.nil?
        next if square.color == color

        return true if square.moves.include?(pos)
      end
    end

    false
  end

  def checkmate?(color)
    return false unless in_check?(color)
    # debugger

    @board.each do |row|
      row.each do |square|
        unless square.nil?
          if square.color == color
            return false unless square.valid_moves.empty?
          end
        end
      end
    end

    true
  end

  def find_king(color)
    #debugger
    flattened_board = @board.flatten
    flattened_board.each do |square|
      if square.class == King
        return square.pos if square.color == color
      end
    end
  end

  def dup
    copy = Board.new
    self.dup_of_pieces(copy)
    # temp_display = Display.new(copy)
    # temp_display.render
    copy
  end

  def dup_of_pieces(copy_board)
    # debugger
    self.board.each_with_index do |row, i|
      row.each_with_index do |square, j|
        # debugg er
        unless square.nil?
          copy_piece = square.dup

          copy_board[copy_piece.pos] = copy_piece
          copy_piece.board = copy_board
        else
          copy_board[[i,j]] = nil
        end
      end
    end
    copy_board
  end

  def rows
    @board
  end
end


class InvalidMoveError < StandardError
end

class NoPieceError < StandardError
end
