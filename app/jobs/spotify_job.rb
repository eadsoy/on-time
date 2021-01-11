class SpotifyJob < ApplicationJob
  queue_as :default

  def perform
    # call SpotifySearcher.something here
    SpotifySearcher.test_create_playlist
  end
end