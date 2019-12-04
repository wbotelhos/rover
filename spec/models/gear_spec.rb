# frozen_string_literal: true

require 'rails_helper'

describe Gear do
  let(:robot) { Robot.new }

  before do
    robot.plateau = Plateau.new
  end

  describe '.turn_to' do
    context 'when direction is "l"' do
      it 'turns to left' do
        expect(robot.gear).to receive :left

        robot.gear.turn_to 'l'
      end

      it 'returns the side' do
        expect(robot.gear.turn_to('l')).to eq(side: :west)
      end
    end

    context 'when direction is "L"' do
      it 'turns to left' do
        expect(robot.gear).to receive :left

        robot.gear.turn_to 'L'
      end
    end

    context 'when direction is "r"' do
      it 'turns to right' do
        expect(robot.gear).to receive :right

        robot.gear.turn_to 'r'
      end

      it 'returns the side' do
        expect(robot.gear.turn_to('r')).to eq(side: :east)
      end
    end

    context 'when direction is "R"' do
      it 'turns to right' do
        expect(robot.gear).to receive :right

        robot.gear.turn_to 'R'
      end
    end

    context 'when other letter then "l" or "r"' do
      it 'turns to right' do
        error = Errors::Gear::UnknowDirection

        expect { robot.gear.turn_to 'x' }.to raise_error error
      end
    end
  end
end
