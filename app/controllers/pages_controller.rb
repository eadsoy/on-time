class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!
  
  def home
    @route = Route.new
    @user = current_user
    @spotify_user = RSpotify::User.new(@user.credential_data)
    if Route.last.present?  
      get_routes_arr
      gon_params
      respond_to do |format|
        format.html  
        format.json  { render :json => @routes }
      end
    end
  end

  private 

  def get_routes_arr
    @routes = Route.all
    @routes_arr = []
    @routes.each do |route|
      @routes_arr << route.route
    end
  end

  def gon_params
    @route_last = Route.last
    gon.routes = @routes_arr
    gon.start = @route_last.start
    gon.end = @route_last.end
    gon.route = @route_last.route
    gon.duration = @route_last.duration
    gon.distance = @route_last.distance
    gon.refresh_token = @spotify_user.credentials.refresh_token
    gon.token = @spotify_user.credentials.token
  end
end
