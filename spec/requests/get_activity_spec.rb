require 'spec_helper'

describe "Get a activity" do
  before do
    @activity = create(:activity, title: "My Awesome Activity", tags: ["fun"])
  end

  it "should return the activity" do
    get activities_path(@activity.id)
    json.first['title'].should eq @activity.title
  end
end
