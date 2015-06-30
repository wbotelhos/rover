class MapsController < ApplicationController
  def explore
    @robot         = Robot.new params[:x], params[:y], params[:side]
    @robot.plateau = Plateau.new params[:plateau][:x], params[:plateau][:y]

    @robot.commands params[:commands]
  end

  def index
  end
end
