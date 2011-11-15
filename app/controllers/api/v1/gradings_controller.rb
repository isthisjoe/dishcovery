class Api::V1::GradingsController < ApplicationController
  respond_to :json
  
  def index
    respond_with @gradings = Grading.all
  end

  def show
    respond_with @grading = Grading.find(params[:id])
  end

  def new
    @grading = Grading.new
  end

  def create
    @grading = Grading.new(params[:grading])
    if @grading.save
      # redirect_to [:api, :v1, @grading], :notice => "Successfully created grading."
      
      # adding a grading to a dish, then we must recalculate the average grade for this dish.
      @grading.dish.calculate_average_grade
      
      respond_with(:api, :v1, @grading)
    else
      # render :action => 'new'
      respond_with :error => true
    end
  end

  def edit
    @grading = Grading.find(params[:id])
  end

  def update
    @grading = Grading.find(params[:id])
    if @grading.update_attributes(params[:grading])
      redirect_to [:api, :v1, @grading], :notice  => "Successfully updated grading."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grading = Grading.find(params[:id])
    @grading.destroy
    redirect_to api_v1_gradings_url, :notice => "Successfully destroyed grading."
  end
end
