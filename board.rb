require 'byebug'
require_relative 'stepping_subclasses'
require_relative 'sliding_subclasses'

class Board
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

  def setup_board
    self[[0, 0]] = Rook.new([0, 0], :white, self)
    # @board
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end


  def move(start, end_pos)
    debugger
    raise "no piece" if self[start].nil?
    raise "invalid move" unless self[start].moves.include?(end_pos)
    # rescue
    # end

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
    pos = find_king(color)

    return true if self[pos].moves.empty? && in_check?(color)

    false
  end

  def find_king(color)
    @board.each_with_index do |row, x|
      row.each_with_index do |square, y|
        return [x, y] if square.class == King
      end
    end
  end

  def dup
    temp_board = @board.deep_dup
    #set dup board pieces to temp_board
    temp_board.each_with_index do |row, x|
      row.each_with_index do |square, y|
        square.board = temp_board if square.class == Piece
      end
    end

    temp_board
  end

  def rows
    @board
  end
end

class Array
  def deep_dup
    new_array = []
    self.each do |el|
      unless el.nil?
        new_array << (el.is_a?(Array) ? el.deep_dup : el.class.new(pos,color, nil))
      else
        new_array << nil
      end
    end
    new_array
  end
end
