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

# def get_route(start_point, end_point)
#   start_point_coor = Geocoder.search(start_point)
#   end_point_coor = Geocoder.search(end_point)
#   Mapbox.access_token = ENV['MAPBOX_API_KEY']
#   route = Mapbox::Directions.directions([{
#     "longitude" => start_point_coor.first.data['lon'].to_f,
#     "latitude" => start_point_coor.first.data['lat'].to_f
#   }, {
#     "longitude" => end_point_coor.first.data['long'].to_f,
#     "latitude" => end_point_coor.first.data['lat'].to_f
#     }], "driving", {
#       geometries: "geojson"
#     })
#   @route_steps = route.first['routes'].first['geometry']['coordinates']
#   @route_distance = route.first['routes'].first['distance']
#   @route_duration = route.first['routes'].first['duration']

#   geo_start = Mapbox::Geocoder.geocode_forward(start_point).first['features'].first['geometry']['coordinates']
#   mapbox_start = [start_point_coor.first.data['lon'].to_f, start_point_coor.first.data['lat'].to_f]
#   p geo_start
#   p mapbox_start
#   p @route_steps
#   # p @route_duration
#   # p @route_distance
#   # p Geocoder::Calculations.distance_between([start_point_coor.first.data['lon'].to_f, start_point_coor.first.data['lat'].to_f], [end_point_coor.first.data['long'].to_f, end_point_coor.first.data['lat'].to_f])
# end

# get_route('Galata Tower', 'Büyükdere Cd., İstanbul')

Route.destroy_all
User.destroy_all
Playlist.destroy_all
  
puts 'Creating User Esin'

# User.create!(
#   email: 'esin.adsoy@gmail.com',
#   password: ENV['MY_PASSWORD'] # because why not
# )
# puts 'User created'

puts 'Creating Esin\'s playlist:'

Playlist.create!(
  title: 'my playlist'
)

puts 'Playlist created'


# start_point_coor = Geocoder.search('İstanbul Atatürk Havalimanı (ISL), Yeşilköy Mah., Bakirköy, Istanbul, Turkey')
# end_point_coor = Geocoder.search('Athina, Attica, Greece')
# if (start_point_coor.presence != nil && end_point_coor.presence != nil) 
#   p start_point_coor.empty? ||  end_point_coor.empty?
#   p end_point_coor
# end

# n = Geocoder.search('Genova, Metropolitan CityGenoa, Italy')
# p n
# m = Mapbox::Geocoder.geocode_forward('Genova, Metropolitan CityGenoa, Italy')
# p m

# m = Mapbox::Geocoder.geocode_forward('Genova, Metropolitan CityGenoa, Italy').first['features'].first['geometry']['coordinates']
# p m

# n = Geocoder.search('Genova, Italy').first.data
# p n