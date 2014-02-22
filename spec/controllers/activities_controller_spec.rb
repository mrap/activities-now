require 'spec_helper'

describe ActivitiesController do

  describe "GET #index with search params" do
    it "should be successful" do
      get :index
      response.should be_successful
    end
  end

  describe "POST #create" do
    let(:activity_params) { attributes_for(:activity, title: "title") }
    let(:post_request) { post :create, activity: activity_params }

    it "should be successful" do
      post_request
      response.should be_successful
    end

    it "should create a new activity" do
      expect{ post_request }.
        to change{Activity.all.count}.by(1)
    end
  end

  describe "GET #show" do
    it "should be successful" do
      @activity = create(:activity)
      get :show, id: @activity.id.to_s
      response.should be_successful
    end
  end
end
