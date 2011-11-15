class Api::V1::DishTypesController < ApplicationController
  respond_to :html,:json
  
  def index
    respond_with(@dish_types = DishType.all)
  end

  def show
    respond_with(@dish_type = DishType.find(params[:id]))
  end

  def new
    @dish_type = DishType.new
  end

  def create
    @dish_type = DishType.new(params[:dish_type])
    if @dish_type.save
      redirect_to @dish_type, :notice => "Successfully created dish type."
    else
      render :action => 'new'
    end
  end

  def edit
    @dish_type = DishType.find(params[:id])
  end

  def update
    @dish_type = DishType.find(params[:id])
    if @dish_type.update_attributes(params[:dish_type])
      redirect_to @dish_type, :notice  => "Successfully updated dish type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dish_type = DishType.find(params[:id])
    @dish_type.destroy
    redirect_to dish_types_url, :notice => "Successfully destroyed dish type."
  end
end
