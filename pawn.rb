require_relative 'piece'

class Pawn < Piece

  attr_accessor :starting_pos

  def initialize(pos, color, board)
    super(pos, color, board)
    @starting_pos = pos
    if color == :white
      @direction = -1
    else
      @direction = 1
    end
  end

  def moves
    available_moves = []
    #debugger
    forward_one = add_pos(pos, [1, 0].map{|el| el * @direction})
    forward_two = add_pos(pos, [2, 0].map{|el| el * @direction})
    attack_side1 = add_pos(pos, [1, 1].map{|el| el * @direction})
    attack_side2 = add_pos(pos, [1, -1].map{|el| el * @direction})

    available_moves << forward_one if move_valid?(forward_one)
    available_moves << forward_two if move_valid?(forward_two) && pos == @starting_pos
    available_moves << attack_side1 if attack_valid?(attack_side1)
    available_moves << attack_side2 if attack_valid?(attack_side2)

    available_moves
  end

  def move_valid?(current_pos)
    return false unless @board.in_bounds?(current_pos)
    square_contents = @board[current_pos]
    return square_contents.nil?
  end

  def attack_valid?(current_pos)
    if @board.in_bounds?(current_pos)
      square_contents = @board[current_pos]
      if !square_contents.nil? && square_contents.color != color
        return true
      end
    end
    false
  end

  def to_s
    ' ♟  '.colorize(@color)
  end

  def dup
    new_copy = Pawn.new(@pos, @color, nil)
    new_copy.starting_pos = @starting_pos
    new_copy
  end
end
