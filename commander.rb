require 'logging'

require_relative 'app/lib/errors/gear/unknow_direction'
require_relative 'app/lib/errors/plateau/out_of_limit'
require_relative 'app/models/brain'
require_relative 'app/models/gear'
require_relative 'app/models/leg'
require_relative 'app/models/plateau'
require_relative 'app/models/robot'

plateau     = Plateau.new *(gets.chomp.split ' ')
queue       = Queue.new
robots_size = 2

while queue.size < robots_size
  point         = gets.chomp
  robot         = Robot.new *(point.split ' ')
  robot.plateau = plateau
  steps         = gets.chomp

  queue << { robot: robot, commands: steps }
end

puts

while queue.size > 0
  data  = queue.pop
  robot = data[:robot]

  robot.commands data[:commands]

  p robot.to_s
end
