
class RoutesController < ApplicationController
  skip_before_action :authenticate_user!
   
  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    @route = Route.new(get_route(@start, @end))
    @route.start = @start
    @route.end = @end
    if @route.save 
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  

  # def route_params
  #   params.require(:route).permit(:start, :end, :route, :distance, :duration)
  # end
end
