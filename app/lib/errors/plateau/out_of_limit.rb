# frozen_string_literal: true

module Errors
  module Plateau
    class OutOfLimit < StandardError
      attr_reader :robot

      def initialize(robot, side)
        @robot = robot
        @side  = side
      end

      def to_s
        point   = "#{@robot.x}x#{@robot.y}"
        plateau = "#{@robot.plateau.x}x#{@robot.plateau.y}"

        "Cannot move from #{point} to #{@side}. Plateau is #{plateau}."
      end
    end
  end
end
