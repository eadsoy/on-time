class Route < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
end

# date, distance, duration, user_id, playlist_id, start_id, end_id

