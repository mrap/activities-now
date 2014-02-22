require 'spec_helper'

describe ActivitiesController do
  describe "GET #index with search params" do
    it "should be successful" do
      get :index
      response.should be_successful
    end
  end
end
