require 'pp'
class SpotifySearcher
  # Search spotify here
  # def self.set_user
  #   @user = current_user
  # end
  def self.test_create_playlist
    @user = current_user
    @spotify_user = RSpotify::User.new(@user.credential_data)
    # @spotify_user.create_playlist!('my_awesome_playlist')
    top_artists = @spotify_user.top_artists # returns 4 artists
    top_tracks = @spotify_user.top_tracks # returns 20 tracks
    
    recommendations_1 = RSpotify::Recommendations.generate(seed_tracks: top_tracks.map(&:id))
    # recommendations_2 = RSpotify::Recommendations.generate(seed_artists: top_artists.map(&:id))
    @tracks = []
    recommendations_1.each do |track|
      @tracks << track.id
    end
    @tracks
    # party = RSpotify::Category.find('party')
    # party.playlists #=> (Playlist array)

    # playlists = RSpotify::Playlist.search('Indie')
    # playlists.first.name #=> "The Indie Mix"

  end
end