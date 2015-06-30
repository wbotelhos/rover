class Robot
  attr_accessor :plateau, :side, :x, :y
  attr_reader :brain
  attr_reader :gear
  attr_reader :leg
  attr_reader :steps

  def initialize(x = 0, y = 0, side = 'N')
    @brain = Brain.new self
    @gear  = Gear.new self
    @leg   = Leg.new self
    @side  = translate_side side # TODO: spec
    @steps = []
    @x     = x.to_i
    @y     = y.to_i
  end

  def command(name)
    return move if name.downcase == 'm'

    turn_to name
  end

  # TODO: spec
  def commands(names)
    names.scan(/./).each do |name|
      self.command name
    end
  end

  # TODO: spec
  def to_s
    "#{self.x} #{self.y} #{self.side.to_s.chr.upcase}"
  end

  private

  def move
    @steps << leg.move
  rescue Errors::Plateau::OutOfLimit => error
    register_error_step error
  end

  def register_error_step(error)
    # Rails.logger.error error.to_s

    @steps << { error: error.to_s, side: self.side, x: self.x, y: self.y }
  end

  # TODO: dirty
  def translate_side(letter)
    {
      e:     :east,
      east:  :east,
      n:     :north,
      north: :north,
      s:     :south,
      south: :south,
      w:     :west,
      west:  :west
    }[letter.downcase.to_sym]
  end

  def turn_to(direction)
    @steps << @gear.turn_to(direction)
  rescue Errors::Gear::UnknowDirection => error
    register_error_step error
  end
end
