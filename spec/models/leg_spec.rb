require 'rails_helper'

describe Leg do
  describe '.move' do
    describe 'return' do
      let(:robot) { Robot.new }

      before do
        robot.plateau = Plateau.new 2, 2
      end

      it 'returns the step' do
        expect(robot.leg.move).to eq(y: 1, side: :north)
      end
    end

    describe 'delegation' do
      let(:robot) { Robot.new 0, 0 }

      it 'calls the robot side method' do
        expect(robot.leg).to receive :north

        robot.leg.move
      end
    end

    describe '.north' do
      let(:robot) { Robot.new 0, 0, :north }

      context 'with space' do
        before do
          robot.plateau = Plateau.new 1, 1
          robot.leg.move
        end

        it 'goes to next position' do
          expect(robot.x).to eq 0
          expect(robot.y).to eq 1
          expect(robot.side).to eq :north
        end
      end

      context 'on edge' do
        let(:robot) { Robot.new 1, 1 }

        before do
          robot.plateau = Plateau.new 1, 1
        end

        it 'cannot move' do
          expect { robot.leg.move }.to raise_error Errors::Plateau::OutOfLimit
        end
      end

      describe 'return' do
        before do
          robot.plateau = Plateau.new 2, 2
        end

        it 'returns the movement and direction' do
          expect(robot.leg.move).to eq(y: 1, side: :north)
        end
      end
    end

    describe '.east' do
      let(:robot) { Robot.new 0, 0, :east }

      context 'with space' do
        before do
          robot.plateau = Plateau.new 1, 1
          robot.leg.move
        end

        it 'goes to next position' do
          expect(robot.x).to eq 1
          expect(robot.y).to eq 0
          expect(robot.side).to eq :east
        end
      end

      context 'on edge' do
        let(:robot) { Robot.new 1, 1 }

        before do
          robot.plateau = Plateau.new 1, 1
        end

        it 'cannot move' do
          expect { robot.leg.move }.to raise_error Errors::Plateau::OutOfLimit
        end
      end

      describe 'return' do
        before do
          robot.plateau = Plateau.new 2, 2
        end

        it 'returns the movement and direction' do
          expect(robot.leg.move).to eq(x: 1, side: :east)
        end
      end
    end

    describe '.south' do
      context 'with space' do
        let(:robot) { Robot.new 1, 1, :south }

        before do
          robot.plateau = Plateau.new 2, 2
          robot.leg.move
        end

        it 'goes to next position' do
          expect(robot.x).to eq 1
          expect(robot.y).to eq 0
          expect(robot.side).to eq :south
        end
      end

      context 'on edge' do
        let(:robot) { Robot.new 0, 0, :south }

        before do
          robot.plateau = Plateau.new 2, 2
        end

        it 'cannot move' do
          expect { robot.leg.move }.to raise_error Errors::Plateau::OutOfLimit
        end
      end

      describe 'return' do
        let(:robot) { Robot.new 0, 1, :south }

        before do
          robot.plateau = Plateau.new 2, 2
        end

        it 'returns the movement and direction' do
          expect(robot.leg.move).to eq(y: -1, side: :south)
        end
      end
    end

    describe '.west' do
      context 'with space' do
        let(:robot) { Robot.new 1, 0, :west }

        before { robot.leg.move }

        it 'goes to next position' do
          expect(robot.x).to eq 0
          expect(robot.y).to eq 0
          expect(robot.side).to eq :west
        end
      end

      context 'on edge' do
        let(:robot) { Robot.new 0, 0, :west }

        it 'cannot move' do
          expect { robot.leg.move }.to raise_error Errors::Plateau::OutOfLimit
        end
      end

      describe 'return' do
        let(:robot) { Robot.new 1, 0, :west }

        before do
          robot.plateau = Plateau.new 2, 2
        end

        it 'returns the movement and direction' do
          expect(robot.leg.move).to eq(x: -1, side: :west)
        end
      end
    end
  end
end
