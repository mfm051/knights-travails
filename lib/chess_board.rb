# frozen_string_literal: true

# nodoc
class ChessBoard
  def self.squares = (0..7).to_a.product((0..7).to_a)

  def self.check_coordinates(coords)
    raise ArgumentError, 'Coordinates must be array with two integers' unless coords in [Integer, Integer]

    coords.each { |i| raise ArgumentError, "#{i} must be between 0 and 7" unless i.between?(0, 7) }
  end
end
