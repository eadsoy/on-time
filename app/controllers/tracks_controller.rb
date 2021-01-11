class TracksController < ApplicationController
  def create
    # call job here
    @user = current_user
    SpotifyJob.perform_now(@user)
    redirect_to root_path
  end
end
