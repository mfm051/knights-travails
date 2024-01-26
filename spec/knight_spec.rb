# frozen_string_literal: true

require_relative '../lib/knight'

describe Knight do
  describe '#possible_moves' do
    subject(:humble_knight) { described_class.new([3, 3]) }

    it 'calculates all squares possible from given location' do
      possible_moves = humble_knight.possible_moves
      expect(possible_moves).to contain_exactly([2, 5], [4, 5], [1, 4], [5, 4], [1, 2], [5, 2], [2, 1], [4, 1])
    end

    context 'when initial position is not a coordinate' do
      it 'returns an error' do
        expect { humble_knight.possible_moves(%w[a b]) }.to raise_error ArgumentError
      end
    end

    context 'when initial position is out of board' do
      it 'return an empty list' do
        possible_moves = humble_knight.possible_moves([9, 9])
        expect(possible_moves).to be_empty
      end
    end
  end
end
