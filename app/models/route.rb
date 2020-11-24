class Route < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
end
