class Api::V1::DishesController < ApplicationController
  respond_to :html,:json
  
  def index
    if (params[:dish_type_id])
      respond_with(@dishes = Dish.find_all_by_dish_type_id(params[:dish_type_id]))
    else
      respond_with(@dishes = Dish.all)
    end
  end

  def show
    respond_with(@dish = Dish.find(params[:id]))
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(params[:dish])
    if @dish.save
      redirect_to @dish, :notice => "Successfully created dish."
    else
      render :action => 'new'
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(params[:dish])
      redirect_to @dish, :notice  => "Successfully updated dish."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to dishes_url, :notice => "Successfully destroyed dish."
  end
end
