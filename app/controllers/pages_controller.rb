class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @route = Route.new
    if Route.last != nil
      route_last = Route.last
      gon.start = route_last.start
      gon.end = route_last.end
      gon.route = route_last.route
      gon.duration = route_last.duration
      gon.distance = route_last.distance
    end
  end
end
