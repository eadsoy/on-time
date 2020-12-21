# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create_table "routes", force: :cascade do |t|
#   t.datetime "date"
#   t.float "distance"
#   t.float "duration"
#   t.bigint "user_id", null: false
#   t.bigint "playlist_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.bigint "start_id"
#   t.bigint "end_id"
#   t.string "route"
#   t.index ["end_id"], name: "index_routes_on_end_id"
#   t.index ["playlist_id"], name: "index_routes_on_playlist_id"
#   t.index ["start_id"], name: "index_routes_on_start_id"
#   t.index ["user_id"], name: "index_routes_on_user_id"
# end


require "mapbox-sdk"
Mapbox.access_token = ENV['MAPBOX_API_KEY']

# drivingDirections = Mapbox::Directions.directions([{
#   "longitude" => -100,
#   "latitude" => 38
# }, {
#   "longitude" => -90,
#   "latitude" => 38
#   }], "driving", {
#     geometries: "geojson"
#   })

# # p drivingDirections.first['routes'].first['geometry']['coordinates']

# # p drivingDirections.first['routes'].first['distance']


# placenames = Mapbox::Geocoder.geocode_reverse({
#   "latitude": 38,
#   "longitude": -100
# })

# placenames_to = Mapbox::Geocoder.geocode_reverse({
#   "latitude": 38,
#   "longitude": -90
# })

def get_route(start_point, end_point)
  start_point_coor = Geocoder.search(start_point)
  end_point_coor = Geocoder.search(end_point)
  Mapbox.access_token = ENV['MAPBOX_API_KEY']
  route = Mapbox::Directions.directions([{
    "longitude" => start_point_coor.first.data['lon'].to_f,
    "latitude" => start_point_coor.first.data['lat'].to_f
  }, {
    "longitude" => end_point_coor.first.data['long'].to_f,
    "latitude" => end_point_coor.first.data['lat'].to_f
    }], "driving", {
      geometries: "geojson"
    })
  @route_steps = route.first['routes'].first['geometry']['coordinates']
  @route_distance = route.first['routes'].first['distance']
  @route_duration = route.first['routes'].first['duration']

  geo_start = Mapbox::Geocoder.geocode_forward(start_point).first['features'].first['geometry']['coordinates']
  mapbox_start = [start_point_coor.first.data['lon'].to_f, start_point_coor.first.data['lat'].to_f]
  p geo_start
  p mapbox_start
  p @route_steps
  # p @route_duration
  # p @route_distance
  # p Geocoder::Calculations.distance_between([start_point_coor.first.data['lon'].to_f, start_point_coor.first.data['lat'].to_f], [end_point_coor.first.data['long'].to_f, end_point_coor.first.data['lat'].to_f])
end

get_route('Galata Tower', 'Büyükdere Cd., İstanbul')

