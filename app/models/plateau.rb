class Plateau
  attr_reader :x, :y

  def initialize(x = 5, y = 5)
    @x = x.to_i
    @y = y.to_i
  end

  def sides
    @sides ||= [:north, :east, :south, :west]
  end
end
