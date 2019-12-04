# frozen_string_literal: true

class Leg
  def initialize(robot)
    @robot = robot
  end

  def move
    send @robot.side
  end

  private

  def north
    max = @robot.brain.max_y?

    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if max

    step nil, 1
  end

  def east
    max = @robot.brain.max_x?

    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if max

    step 1, nil
  end

  def south
    min = @robot.brain.min_y?

    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if min

    step nil, -1
  end

  def step(x, y)
    @robot.x += x if x
    @robot.y += y if y

    { side: @robot.side }.tap do |hash|
      hash[:x] = x if x
      hash[:y] = y if y
    end
  end

  def west
    min = @robot.brain.min_x?

    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if min

    step(-1, nil)
  end
end
