
class RoutesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    @route_first = Route.new.get_route(@start, @end)
    @route = Route.new(route_params)
    gon.route = @route.route
    gon.duration = @route.duration
    gon.distance = @route.distance
    if @route.save 
      render :root
    end
  end

  private

  def route_params
    params.require(:route).permit(:start, :end, :route, :distance, :duration)
  end
end
