require 'rails_helper'

describe Plateau do

  describe ':area' do
    it 'has 5 x 5 as default' do
      plateau = Plateau.new

      expect(plateau.x).to eq 5
      expect(plateau.y).to eq 5
    end

    it 'can be constructed' do
      plateau = Plateau.new 1, 2

      expect(plateau.x).to eq 1
      expect(plateau.y).to eq 2
    end

    it 'is constructed as integer' do
      plateau = Plateau.new '1', '2'

      expect(plateau.x).to eq 1
      expect(plateau.y).to eq 2
    end
  end

  it 'has the right sides' do
    expect(Plateau.new.sides).to eq [:north, :east, :south, :west]
  end

  it 'expose x axis' do
    expect(Plateau.new.x).to eq 5
  end

  it 'expose y axis' do
    expect(Plateau.new.y).to eq 5
  end
end
