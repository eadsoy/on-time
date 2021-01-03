# require "mapbox-sdk"
class Route < ApplicationRecord
  # before_save :get_route
  belongs_to :user
  belongs_to :playlist
  # has_one :start
  # has_one :end
  # store :route, accessors: [ :start, :end ]
  serialize :start, Array
  serialize :end, Array
  serialize :route, Array


  def self.get_route(start_point, end_point)
    start_point_coor = Geocoder.search(start_point)
    end_point_coor = Geocoder.search(end_point)
    start_lon_lat = [start_point_coor.first.data['lon'].to_f, start_point_coor.first.data['lat'].to_f]
    end_lon_lat = [end_point_coor.first.data['lon'].to_f, end_point_coor.first.data['lat'].to_f]
    Mapbox.access_token = ENV['MAPBOX_API_KEY']
    get_route = Mapbox::Directions.directions([
      {
        "longitude" => start_lon_lat.first,
        "latitude" => start_lon_lat.last
      }, {
        "longitude" => end_lon_lat.first,
        "latitude" => end_lon_lat.last
      }], "driving", {
      geometries: "geojson"
      })
    route_params = {}
    route_params[:route] = get_route.first['routes'].first['geometry']['coordinates']
    p route_params[:route]
    route_params[:distance] = get_route.first['routes'].first['distance']
    route_params[:duration] = get_route.first['routes'].first['duration']
    route_params[:start] = start_lon_lat
    route_params[:end] = end_lon_lat
    route_params[:user] = User.last
    route_params[:playlist] = Playlist.last
    route_params
    
  end
  
end
# FIXME 
# date, check distance, check duration,check user_id,  playlist_id, check start_id, check end_id
