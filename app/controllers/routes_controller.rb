
class RoutesController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :authenticate_user!

  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    route_params = Route.get_route(@start, @end)
    @route = Route.new(route_params)
    @route.user = current_user
    if route_params.present?
      if @route.save!
        flash[:notice] = '🥳 Check your route on the map!'
        redirect_to root_path 
      else
        redirect_to root_path 
      end 
    else
      flash[:alert] = '🚨 Please enter another route'
      redirect_to root_path 
    end
  end

  private
  # def route_params
  #   params.require(:route).permit(:start, :end, :route, :distance, :duration)
  # end
end
