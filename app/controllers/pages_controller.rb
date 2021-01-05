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
      gon.start = route_last.start
      gon.end = route_last.end
      gon.route = route_last.route
      gon.duration = route_last.duration
      gon.distance = route_last.distance
    end
  end
end
