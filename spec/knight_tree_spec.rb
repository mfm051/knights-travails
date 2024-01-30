# frozen_string_literal: true

require_relative '../lib/knight_tree'

describe KnightTree do
  matcher :be_children_of do |parent|
    match do |children|
      children.all? { |child| child.parent == parent }
    end
  end

  describe '#initialize' do
    it 'returns an error if coordinates are not two integers' do
      expect { KnightTree.new(['c', 4]) }.to raise_error ArgumentError
    end

    it 'returns an error if any coordinate is out of range' do
      expect { KnightTree.new([8, 4]) }.to raise_error ArgumentError
    end
  end

  describe '#build_children' do
    subject(:knight_tree) { described_class.new([3, 3]) }

    it 'calculates all squares possible from given location' do
      children_coordinates = knight_tree.children.map(&:coordinates)
      expect(children_coordinates).to contain_exactly([2, 5], [4, 5], [1, 4], [5, 4], [1, 2], [5, 2], [2, 1], [4, 1])
    end

    it 'creates parent/child relation with children' do
      children = knight_tree.children
      expect(children).to be_children_of(knight_tree)
    end
  end
end
