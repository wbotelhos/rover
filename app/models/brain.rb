# frozen_string_literal: true

class Brain
  def initialize(robot)
    @robot = robot
  end

  def east?
    @robot.side == :east
  end

  def max_x?
    @robot.x == @robot.plateau.x
  end

  def min_x?
    @robot.x == 0
  end

  def max_y?
    @robot.y == @robot.plateau.y
  end

  def min_y?
    @robot.y == 0
  end

  def north?
    @robot.side == :north
  end

  def south?
    @robot.side == :south
  end

  def west?
    @robot.side == :west
  end
end
