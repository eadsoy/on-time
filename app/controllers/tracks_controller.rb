class TracksController < ApplicationController
  def create
    # call job here
    SpotifyJob.perform_later
  end
end
