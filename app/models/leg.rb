class Leg
  def initialize(robot)
    @robot = robot
  end

  def move
    send @robot.side
  end

  private

  def north
    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if @robot.brain.max_y?

    step nil, 1, __method__
  end

  def east
    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if @robot.brain.max_x?

    step 1, nil, __method__
  end

  def south
    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if @robot.brain.min_y?

    step nil, -1, __method__
  end

  def step(x, y, side)
    @robot.x += x if x
    @robot.y += y if y

    { side: @robot.side }.tap do |hash|
      hash[:x] = x if x
      hash[:y] = y if y
    end
  end

  def west
    raise Errors::Plateau::OutOfLimit.new(@robot, __method__) if @robot.brain.min_x?

    step -1, nil, __method__
  end
end
