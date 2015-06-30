class MapsController < ApplicationController
  def explore
    @robot         = Robot.new(*robot_params)
    @robot.plateau = Plateau.new(*plateau_params)

    @robot.commands params[:commands]
  end

  def index
  end

  private

  def plateau_params
    [params[:plateau][:x], params[:plateau][:y]]
  end

  def robot_params
    [params[:x], params[:y], params[:side]]
  end
end
