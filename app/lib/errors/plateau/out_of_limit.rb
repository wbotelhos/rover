module Errors
  module Plateau
    class OutOfLimit < StandardError
      attr_reader :robot

      def initialize(robot, side)
        @robot = robot
        @side  = side
      end

      def to_s
        "Cannot move from #{@robot.x}x#{@robot.y} to #{@side}. Plateau is #{@robot.plateau.x}x#{@robot.plateau.y}."
      end
    end
  end
end
