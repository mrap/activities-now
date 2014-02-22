require 'spec_helper'

describe "Search for activities by tags" do
  before do
    @activity = create(:activity, title: "My Awesome Activity", tags: ["fun"])
    @untagged_activity = create(:activity, title: "Another Activity")
  end

  context "by tag" do
    it "should return the tagged activity" do
      get activities_path, search: "fun"
      json.count.should eq 1
      json.first['title'].should eq @activity.title
    end
  end

  context "by title" do
    it "should return the tagged activity" do
      get activities_path, search: "awesome"
      json.count.should eq 1
      json.first['title'].should eq @activity.title
    end
  end

end
