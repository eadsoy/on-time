
class RoutesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    @route = Route.new.get_route(@start, @end)
    gon.route = @route.route_steps
    gon.duration = @route.route_duration
    gon.distance = @route.route_distance
    p see
  end

  private

  def route_params
    params.require(:route).permit(:start, :end, :route)
  end
end
