require 'spec_helper'

describe "Create an activity" do
  before do
    post activities_path, activity: { title: "activity name" }
  end

  it "should return the newly created activity" do
    json['title'].should eq "activity name"
  end
end
