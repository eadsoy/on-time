class Route < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  geocoded_by :start_address
  geocoded_by :end_address
  after_validation :geocode, if: :will_save_change_to_address?
end
