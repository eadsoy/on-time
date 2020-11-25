class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @routes = Route.all
    @route = Route.new
    @playlist = Playlist.new
    @route.playlist = @playlist
    @route.user = current_user
    @track = Track.new
    @track.playlist = @playlist
  end
end
