require 'rails_helper'

describe Robot do
  let(:robot) { described_class.new }

  before do
    robot.plateau = Plateau.new
  end

  describe 'x' do
    context 'when provided as string' do
      let(:robot) { described_class.new '1', '1' }

      it 'becomes integer' do
        expect(robot.x.class).to eq Fixnum
      end
    end
  end

  describe 'y' do
    context 'when provided as string' do
      let(:robot) { described_class.new '1', '1' }

      it 'becomes integer' do
        expect(robot.y.class).to eq Fixnum
      end
    end
  end

  describe ':steps' do
    it 'starts empty' do
      expect(robot.steps).to be_empty
    end
  end

  describe 'accessors' do
    describe ':x' do
      context 'when provided' do
        before { robot.x = 1 }

        it 'can be taken' do
          expect(robot.x).to eq 1
        end
      end

      context 'when not provided' do
        it 'receives zero' do
          expect(robot.x).to eq 0
        end
      end
    end

    describe ':y' do
      context 'when provided' do
        before { robot.y = 2 }

        it 'can be taken' do
          expect(robot.y).to eq 2
        end
      end

      context 'when not provided' do
        it 'receives zero' do
          expect(robot.y).to eq 0
        end
      end
    end

    describe ':side' do
      context 'when provided' do
        before { robot.side = :east }

        it 'can be taken' do
          expect(robot.side).to eq :east
        end
      end

      context 'when not provided' do
        it 'receives north' do
          expect(robot.side).to eq :north
        end
      end
    end
  end

  describe '.command' do
    context 'r' do
      it 'ticks on the rigth position' do
        expect(robot.side).to eq :north
        robot.command 'r'
        expect(robot.side).to eq :east
        robot.command 'r'
        expect(robot.side).to eq :south
        robot.command 'r'
        expect(robot.side).to eq :west
        robot.command 'r'
        expect(robot.side).to eq :north
        robot.command 'r'
        expect(robot.side).to eq :east
      end

      describe 'steps' do
        context 'whe moviment happens once' do
          before { robot.command 'r' }

          it 'is saved' do
            expect(robot.steps).to eq [{ side: :east }]
          end

          context 'whe moviment happens twice' do
            before do
              robot.command 'r'
            end

            it 'is saved again' do
              expect(robot.steps).to eq [{ side: :east }, { side: :south }]
            end
          end
        end
      end
    end

    context 'l' do
      it 'ticks on the rigth position' do
        expect(robot.side).to eq :north
        robot.command 'l'
        expect(robot.side).to eq :west
        robot.command 'l'
        expect(robot.side).to eq :south
        robot.command 'l'
        expect(robot.side).to eq :east
        robot.command 'l'
        expect(robot.side).to eq :north
        robot.command 'l'
        expect(robot.side).to eq :west
      end

      describe 'steps' do
        context 'whe moviment happens once' do
          before { robot.command 'l' }

          it 'is saved' do
            expect(robot.steps).to eq [{ side: :west }]
          end

          context 'whe moviment happens twice' do
            before do
              robot.command 'l'
            end

            it 'is saved again' do
              expect(robot.steps).to eq [{ side: :west }, { side: :south }]
            end
          end
        end
      end
    end

    context 'm' do
      it 'delegates to leg object' do
        expect(robot.leg).to receive :move

        robot.command 'm'
      end

      it 'returns the axis and redundant side for better view manipulation' do
        expect(robot.command 'm').to eq [{ y: 1, side: :north }]
      end

      context 'with uppercase' do
        it 'returns the axis and redundant side for better view manipulation' do
          expect(robot.command 'M').to eq [{ y: 1, side: :north }]
        end
      end

      describe 'steps' do
        context 'whe moviment happens once' do
          before { robot.command 'm' }

          it 'is saved' do
            expect(robot.steps).to eq [{ y: 1, side: :north }]
          end

          context 'whe moviment happens twice' do
            before do
              robot.side = :east
              robot.command 'm'
            end

            it 'is saved again' do
              expect(robot.steps).to eq [{ y: 1, side: :north }, { x: 1, side: :east }]
            end
          end
        end

        context 'whe moviment cannot be done' do
          before do
            robot.side = :west
          end

          it 'holds the error' do
            expect { robot.command 'm' }.to_not raise_error
          end

          describe ':steps' do
            it 'adds an error step' do
              robot.command 'm'

              expect(robot.steps[0][:x]).to eq 0
              expect(robot.steps[0][:y]).to eq 0
              expect(robot.steps[0][:side]).to eq :west
              expect(robot.steps[0][:error]).to match %(0x0.*west.*5x5)
            end

            xit 'logs the error' do
              expect(Rails.logger).to receive(:error).with %r(0x0.*west.*5x5)

              robot.command 'm'
            end
          end
        end
      end
    end

    context 'whe robot does not no the side to turn' do
      it 'holds the error' do
        expect { robot.command 'x' }.to_not raise_error
      end

      describe ':steps' do
        it 'adds an error step' do
          robot.command 'x'

          expect(robot.steps[0][:x]).to eq 0
          expect(robot.steps[0][:y]).to eq 0
          expect(robot.steps[0][:side]).to eq :north
          expect(robot.steps[0][:error]).to match %(x)
        end

        xit 'logs the error' do
          expect(Rails.logger).to receive(:error).with %r(x)

          robot.command 'x'
        end
      end
    end

    context 'with lot of commands' do
      it 'creates all steps' do
        robot.command 'm'
        robot.command 'r'
        robot.command 'm'
        robot.command 'r'
        robot.command 'm'
        robot.command 'r'
        robot.command 'm'

        expect(robot.steps).to eq [
          { side: :north, y: 1 },
          { side: :east },
          { side: :east, x: 1 },
          { side: :south },
          { side: :south, y: -1 },
          { side: :west },
          { side: :west, x: -1 }
        ]
      end
    end
  end
end
