# frozen_string_literal: true

require_relative './chess_board'

# Tree of possibilities for knight moves
class KnightTree
  attr_reader :coordinates, :children, :parent

  def initialize(coordinates, parent = nil)
    @coordinates = coordinates
    @parent = parent
    @children = nil
  end

  def build_children
    @children = possible_moves.map { |move| KnightTree.new(move, self) }
  end

  private

  def possible_moves
    x_coord, y_coord = @coordinates

    ChessBoard.squares.filter do |square|
      x_final = square[0]
      y_final = square[1]

      steps_x = (x_final - x_coord).abs
      steps_y = (y_final - y_coord).abs

      (steps_x == 2 && steps_y == 1) || (steps_x == 1 && steps_y == 2)
    end
  end
end
