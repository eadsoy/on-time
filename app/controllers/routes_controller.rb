
class RoutesController < ApplicationController
  skip_before_action :authenticate_user!
   
  def create
    @start = params[:route][:start]
    @end = params[:route][:end]
    @route = Route.new(get_route(@start, @end))
    gon.start = @route.route.first
    gon.end = @route.route.last
    gon.route = @route.route
    gon.duration = @route.duration
    gon.distance = @route.distance
    if @route.save 
      redirect_to root_path
    end
  end

  private

  def get_route(start_point, end_point)
    start_point_coor = Geocoder.search(start_point)
    end_point_coor = Geocoder.search(end_point)
    Mapbox.access_token = ENV['MAPBOX_API_KEY']
    get_route = Mapbox::Directions.directions([
      {
        "longitude" => start_point_coor.first.data['lon'].to_f,
        "latitude" => start_point_coor.first.data['lat'].to_f
      }, {
        "longitude" => end_point_coor.first.data['long'].to_f,
        "latitude" => end_point_coor.first.data['lat'].to_f
      }], "driving", {
      geometries: "geojson"
      })
    route_params = {}
    route_params[:route] = get_route.first['routes'].first['geometry']['coordinates']
    route_params[:distance] = get_route.first['routes'].first['distance']
    route_params[:duration] = get_route.first['routes'].first['duration']
    # route_params[:start] = start_point_coor
    # route_params[:end] = end_point_coor
    route_params
  end

  # def route_params
  #   params.require(:route).permit(:start, :end, :route, :distance, :duration)
  # end
end
