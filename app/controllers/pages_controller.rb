require 'pp'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  
  def home
    respond_to do |format|
      format.html  
      format.json  { render :json => @routes }
    end
    @route = Route.new
    if Route.last != nil  #FIXME use presence
      route_last = Route.last
      route_all = Route.all
      route_all_list = []
      gon.start = route_last.start
      gon.end = route_last.end
      gon.route = route_last.route
      gon.duration = route_last.duration
      gon.distance = route_last.distance
      route_all.each do |route|
        route_all_list << route.route
      end
      gon.routes = route_all_list
    end
  end

  # def callback
    # url = "https://accounts.spotify.com/authorize"
    # query_params = {
    #   client_id: ENV["SPOTIFY_CLIENT_ID"],
    #   response_type: 'code',
    #   redirect_uri: 'http://localhost:3000/auth/spotify/callback',
    #   scope: "user-library-read 
    #   playlist-read-collaborative
    #   playlist-modify-private
    #   user-modify-playback-state
    #   user-read-private
    #   user-top-read
    #   playlist-modify-public",
    #   show_dialog: true
    # }
    # redirect_to "#{url}?#{query_params.to_query}"
    # @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    # pp @spotify_user
    # pp @spotify_user.credentials
    # @spotify_user = RSpotify::User.new(
    #   {
    #     'credentials' => {
    #        "token" => self.credentials["access_token"],
    #        "refresh_token" => self.credentials["refresh_token"],
    #        "access_refresh_callback" => callback_proc
    #     } ,
    #     'id' => self.credentials["user_id"]
    #   })
    # render :callback
  # end
end
