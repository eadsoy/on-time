require 'pp'
class SpotifySearcher
  # Search spotify here
  def self.test_create_playlist(user)
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    @spotify_user = RSpotify::User.new(user.credential_data)
    # @spotify_user.create_playlist!('my_awesome_playlist')
    @top_artists = @spotify_user.top_artists # returns 4 artists
    # top_tracks = @spotify_user.top_tracks # returns 20 tracks
    
    # recommendations_1 = RSpotify::Recommendations.generate(seed_tracks: top_tracks.map(&:id))
    # recommendations_2 = RSpotify::Recommendations.generate(seed_artists: top_artists.map(&:id))
    puts @spotify_user
    puts @top_artists
    # playlists = RSpotify::Playlist.search('Indie')
    # name = playlists.first.name #=> "The Indie Mix"
    # p name
    # @tracks = []
    # party.each do |track|
    #   @tracks << track.name
    # end
    # p @tracks
    # party = RSpotify::Category.find('party')
    # party.playlists #=> (Playlist array)

    # playlists = RSpotify::Playlist.search('Indie')
    # playlists.first.name #=> "The Indie Mix"

  end
end