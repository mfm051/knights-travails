# frozen_string_literal: true

require_relative '../lib/chess_board'

describe ChessBoard do
  describe ':squares' do
    let(:squares) { ChessBoard.squares }

    it 'returns all 64 possible squares in a chess board' do
      expect(squares.size).to eq 64
    end

    it 'returns each square as a double-coordinate array' do
      expect(squares.all? { |square| square in [Integer, Integer] }).to eq true
    end

    it 'has no repeated coordinates' do
      expect(squares).to eq(squares.uniq)
    end
  end
end
