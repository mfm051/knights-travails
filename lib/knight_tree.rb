# frozen_string_literal: true

require_relative './chess_board'

# Tree of possibilities for knight moves
class KnightTree
  include Comparable

  attr_reader :coordinates, :parent

  def initialize(coordinates, parent = nil)
    @coordinates = coordinates
    @parent = parent
  end

  def children = possible_moves.map { |move| KnightTree.new(move, self) }

  def <=>(other)
    coordinates <=> other
  end

  def full_path
    path = [coordinates]
    current = self

    until current.parent.nil?
      path.unshift(current.parent.coordinates)
      current = current.parent
    end

    path
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
