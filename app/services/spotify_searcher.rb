class SpotifySearcher
  # Search spotify here
  def initialize
    @user = current_user
    @spotify_user = RSpotify::User.find(@user.uid) 
  end

  
end