class SpotifyJob < ApplicationJob
  queue_as :default

  def perform(user)
    # call SpotifySearcher.something here
    SpotifySearcher.test_create_playlist(user)
  end
end