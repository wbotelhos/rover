# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Errors::Plateau::OutOfLimit do
  let(:robot) { Robot.new 1, 1 }
  let(:error) { described_class.new robot, :north }

  before do
    robot.plateau = Plateau.new 2, 2
  end

  it 'builds the right message' do
    expect(error.to_s).to match(/1x1.*north.*2x2/)
  end

  it 'can reader robot' do
    expect(error.robot).to be robot
  end
end
