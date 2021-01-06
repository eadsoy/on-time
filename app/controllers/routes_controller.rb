
class RoutesController < ApplicationController
  skip_before_action :authenticate_user!
   
  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    route_params = Route.get_route(@start, @end)
    @route = Route.new(route_params)
    if route_params.present?
      if @route.save!
        flash[:notice] = '🥳 Check your route on the map!'
        reload_page
      else
        reload_page
      end 
    else
      flash[:alert] = '🚨 Please enter another route'
      reload_page
    end
  end

  private

  def reload_page
    respond_to do |format|
      format.html { redirect_to current_page_url, notice: '🚨 Please enter another route' }
      format.json { head :no_content }
    end
  end
  # def route_params
  #   params.require(:route).permit(:start, :end, :route, :distance, :duration)
  # end
end
