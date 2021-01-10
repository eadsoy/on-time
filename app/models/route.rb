# require "mapbox-sdk"
Mapbox.access_token = ENV['MAPBOX_API_KEY']
class Route < ApplicationRecord
  belongs_to :user
  # store :route, accessors: [ :start, :end ]
  serialize :start, Array
  serialize :end, Array
  serialize :route, Array

  def self.validate_points(start_point, end_point)
    regex_coordinates = '^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?)\s*,\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$'
    match_start = start_point.match?(regex_coordinates)
    match_end = end_point.match?(regex_coordinates)
    case match_start
    when true
      @start_lon_lat = start_point.chomp.split(',').map(&:to_f)
    else
      @start_lon_lat = Mapbox::Geocoder.geocode_forward(start_point).first['features'].first['geometry']['coordinates']
    end

    case match_end
    when true
      @end_lon_lat = end_point.chomp.split(',').map(&:to_f)
    else
      @end_lon_lat = Mapbox::Geocoder.geocode_forward(end_point).first['features'].first['geometry']['coordinates']
    end
  end

  def self.get_route(start_point, end_point)
    validate_points(start_point, end_point)
    route_params = {}
    if (@start_lon_lat.present? && @end_lon_lat.present?)  
      get_route = Mapbox::Directions.directions([
        {
          "longitude" => @start_lon_lat.first,
          "latitude" => @start_lon_lat.last
        }, {
          "longitude" => @end_lon_lat.first,
          "latitude" => @end_lon_lat.last
        }], "driving", {
        geometries: "geojson"
        })
      route_params[:route] = get_route.first['routes'].first['geometry']['coordinates']
      route_params[:distance] = get_route.first['routes'].first['distance']
      route_params[:duration] = get_route.first['routes'].first['duration']
      route_params[:start] = @start_lon_lat
      route_params[:end] = @end_lon_lat
    end
    route_params
  end
end
# FIXME 
# route.playlist, route.user
# apply actioncable
# move to service object
