# frozen_string_literal: true

require_relative '../lib/knight'

describe Knight do
  subject(:humble_knight) { Knight.new }

  describe '#knight_moves' do
    it 'returns shortest path from initial position to final position' do
      path_one_step = humble_knight.knight_moves([0, 0], [1, 2])
      expect(path_one_step).to eq [[0, 0], [1, 2]]
    end

    context 'when there are multiple possible paths' do
      it 'returns one of the shortest' do
        path_seven_steps = humble_knight.knight_moves([0, 0], [7, 7])
        expect(path_seven_steps.size).to eq 7
      end
    end

    context 'when one of the positions is out of range' do
      it 'return an error' do
        expect { humble_knight.knight_moves([0, 0], [8, 8]) }.to raise_error ArgumentError
      end
    end
  end
end
