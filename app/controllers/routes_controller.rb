class RoutesController < ApplicationController
  def create
    gon.start = params[:start]
    gon.end = params[:end]
  end
end
