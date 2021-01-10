class SpotifyJob < ApplicationJob
  queue_as :default

  def perform
    # call SpotifySearcher.something here
  end
end