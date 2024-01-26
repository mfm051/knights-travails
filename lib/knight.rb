# frozen_string_literal: true

require_relative './chess_board'

# nodoc
class Knight
  def initialize(initial_position)
    @initial_position = initial_position
  end

  def possible_moves(initial_position = @initial_position)
    raise ArgumentError, 'argument must be coordinate [x, y]' unless initial_position in [Integer, Integer]

    x_coord = initial_position[0]
    y_coord = initial_position[1]

    ChessBoard.squares.filter do |square|
      x_final = square[0]
      y_final = square[1]

      steps_x = (x_final - x_coord).abs
      steps_y = (y_final - y_coord).abs

      (steps_x == 2 && steps_y == 1) || (steps_x == 1 && steps_y == 2)
    end
  end
end
