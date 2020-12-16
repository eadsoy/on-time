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

drivingDirections = Mapbox::Directions.directions([{
  "longitude" => -100,
  "latitude" => 38
}, {
  "longitude" => -90,
  "latitude" => 38
  }], "driving", {
    geometries: "geojson"
  })

# p drivingDirections.first['routes'].first['geometry']['coordinates']

# p drivingDirections.first['routes'].first['distance']


placenames = Mapbox::Geocoder.geocode_reverse({
  "latitude": 38,
  "longitude": -100
})

placenames_to = Mapbox::Geocoder.geocode_reverse({
  "latitude": 38,
  "longitude": -90
})

p placenames
p placenames_to