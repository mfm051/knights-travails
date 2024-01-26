# frozen_string_literal: true

require_relative '../lib/knight'

describe Knight do
  describe '#possible_moves' do
    subject(:humble_knight) { described_class.new([3, 3]) }

    it 'calculates all squares possible from given location' do
      possible_moves = humble_knight.possible_moves
      expect(possible_moves).to contain_exactly([2, 5], [4, 5], [1, 4], [5, 4], [1, 2], [5, 2], [2, 1], [4, 1])
    end
  end
end
