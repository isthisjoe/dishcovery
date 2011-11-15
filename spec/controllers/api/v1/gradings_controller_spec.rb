require File.dirname(__FILE__) + '/../spec_helper'

describe Api::V1::GradingsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Grading.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Grading.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Grading.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(api_v1_grading_url(assigns[:grading]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Grading.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Grading.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Grading.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Grading.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Grading.first
    response.should redirect_to(api_v1_grading_url(assigns[:grading]))
  end

  it "destroy action should destroy model and redirect to index action" do
    grading = Grading.first
    delete :destroy, :id => grading
    response.should redirect_to(api_v1_gradings_url)
    Grading.exists?(grading.id).should be_false
  end
end
