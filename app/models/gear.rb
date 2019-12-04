# frozen_string_literal: true

class Gear
  def initialize(robot)
    @robot = robot
  end

  def turn_to(direction)
    return left  if direction.casecmp('l').zero?
    return right if direction.casecmp('r').zero?

    raise Errors::Gear::UnknowDirection, direction
  end

  private

  def left
    step sides[side_index == 0 ? sides.size - 1 : side_index - 1]
  end

  def right
    step sides[side_index < sides.size - 1 ? side_index + 1 : 0]
  end

  def sides
    @sides ||= @robot.plateau.sides
  end

  def step(side)
    @robot.side = side

    { side: @robot.side }
  end

  def side_index
    sides.index @robot.side.to_sym
  end
end
