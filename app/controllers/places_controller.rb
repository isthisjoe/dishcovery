class PlacesController < ApplicationController
  respond_to :json
  
  def index
    respond_with(Place.all, :only => [:name])
  end

  def show
    respond_with(Place.find(params[:id]))
  end
  
  def create
    respond_with(true)
  end
  
  def update
    respond_with(true)
  end
end
