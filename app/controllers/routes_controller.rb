
class RoutesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    see = Route.new.get_route(@start, @end)
    p see
  end

  private

  def route_params
    params.require(:route).permit(:start, :end, :route)
  end
end
