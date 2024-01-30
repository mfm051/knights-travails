# frozen_string_literal: true

require_relative './knight_tree'

# nodoc
class Knight
  def knight_moves(initial_position, final_position)
    [initial_position, final_position].each { |pos| ChessBoard.check_coordinates(pos) }

    root = KnightTree.new(initial_position)

    current_search = root.children
    current_search = current_search.flat_map(&:children) until current_search.include?(final_position)

    result = current_search.find { |pos| pos == final_position }
    result.full_path
  end
end
