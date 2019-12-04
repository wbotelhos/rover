# frozen_string_literal: true

require 'rails_helper'

describe Brain do
  describe '.north?' do
    context 'when robot side is north' do
      let(:robot) { Robot.new }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_north
      end
    end

    context 'when robot side is not north' do
      let(:robot) { Robot.new 0, 0, :west }

      it 'returns false' do
        expect(robot.brain).not_to be_north
      end
    end
  end

  describe '.east?' do
    context 'when robot side is east' do
      let(:robot) { Robot.new 0, 0, :east }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_east
      end
    end

    context 'when robot side is not east' do
      let(:robot) { Robot.new }

      it 'returns false' do
        expect(robot.brain).not_to be_east
      end
    end
  end

  describe '.south?' do
    context 'when robot side is south' do
      let(:robot) { Robot.new 0, 0, :south }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_south
      end
    end

    context 'when robot side is not south' do
      let(:robot) { Robot.new }

      it 'returns false' do
        expect(robot.brain).not_to be_south
      end
    end
  end

  describe '.west?' do
    context 'when robot side is west' do
      let(:robot) { Robot.new 0, 0, :west }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_west
      end
    end

    context 'when robot side is not west' do
      let(:robot) { Robot.new }

      it 'returns false' do
        expect(robot.brain).not_to be_west
      end
    end
  end

  describe '.max_x?' do
    context 'on limit' do
      let(:robot) { Robot.new 2, 2 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_max_x
      end
    end

    context 'out of limit' do
      let(:robot) { Robot.new 0, 0 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns false' do
        expect(robot.brain).not_to be_max_x
      end
    end
  end

  describe '.max_y?' do
    context 'on limit' do
      let(:robot) { Robot.new 2, 2 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_max_y
      end
    end

    context 'out of limit' do
      let(:robot) { Robot.new 0, 0 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns false' do
        expect(robot.brain).not_to be_max_y
      end
    end
  end

  describe '.min_x?' do
    context 'on limit' do
      let(:robot) { Robot.new 0, 0 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_min_x
      end
    end

    context 'out of limit' do
      let(:robot) { Robot.new 1, 0 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns false' do
        expect(robot.brain).not_to be_min_x
      end
    end
  end

  describe '.min_y?' do
    context 'on limit' do
      let(:robot) { Robot.new 0, 0 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns true' do
        expect(robot.brain).to be_min_y
      end
    end

    context 'out of limit' do
      let(:robot) { Robot.new 0, 1 }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns false' do
        expect(robot.brain).not_to be_min_y
      end
    end
  end
end
