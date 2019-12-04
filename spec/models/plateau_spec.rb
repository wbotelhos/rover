# frozen_string_literal: true

require 'rails_helper'

describe Plateau do
  describe ':area' do
    it 'has 5 x 5 as default' do
      plateau = described_class.new

      expect(plateau.x).to eq 5
      expect(plateau.y).to eq 5
    end

    it 'can be constructed' do
      plateau = described_class.new 1, 2

      expect(plateau.x).to eq 1
      expect(plateau.y).to eq 2
    end

    it 'is constructed as integer' do
      plateau = described_class.new '1', '2'

      expect(plateau.x).to eq 1
      expect(plateau.y).to eq 2
    end
  end

  it 'has the right sides' do
    expect(described_class.new.sides).to eq %i[north east south west]
  end

  it 'expose x axis' do
    expect(described_class.new.x).to eq 5
  end

  it 'expose y axis' do
    expect(described_class.new.y).to eq 5
  end
end
