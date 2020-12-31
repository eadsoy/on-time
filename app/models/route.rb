# require "mapbox-sdk"
class Route < ApplicationRecord
  
  belongs_to :user
  belongs_to :playlist
  # has_one :start
  # has_one :end
  # store :route, accessors: [ :start, :end ]
  serialize :start, Array
  serialize :end, Array
  serialize :route, Array

  
end
# FIXME 
# date, check distance, check duration,check user_id,  playlist_id, check start_id, check end_id
