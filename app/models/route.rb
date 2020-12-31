# require "mapbox-sdk"
class Route < ApplicationRecord
  
  belongs_to :user
  belongs_to :playlist
  # has_one :start
  # has_one :end
  # store :route, accessors: [ :start, :end ]
  # serialize :start, Array
  # serialize :end, Array
  serialize :route, Array


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
    # route_params[:start] = route_params[:route].first
    # route_params[:end] = route_params[:route].last
    route_params
  end
  
end
# FIXME 
# date, check distance, check duration,check user_id,  playlist_id, check start_id, check end_id
