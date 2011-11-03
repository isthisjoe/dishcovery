class PlacesController < ApplicationController
  respond_to :json
  
  def index
    respond_with(Place.all)
  end

  def show
    respond_with(Place.find(params[:id]))
  end
end
