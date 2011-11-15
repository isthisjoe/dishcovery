class Api::V1::GradesController < ApplicationController
  respond_to :json
  
  def index
    respond_with @grades = Grade.all(:order => "value DESC")
  end

  def show
    respond_with @grade = Grade.find(params[:id])
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(params[:grade])
    if @grade.save
      redirect_to [:api, :v1, @grade], :notice => "Successfully created grade."
    else
      render :action => 'new'
    end
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(params[:grade])
      redirect_to [:api, :v1, @grade], :notice  => "Successfully updated grade."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    redirect_to api_v1_grades_url, :notice => "Successfully destroyed grade."
  end
end
