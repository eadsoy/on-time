class RoutesController < ApplicationController
  def create
    raise
    params[:route] = Route.get_route(@start, @end)
    @route = Route.new(route_params)
    if @route.save
      render :root
    end
  end

  private

  def route_params
    params.require(:route).permit(:start, :end, :route)
  end


end
