require 'spec_helper'

describe Activity do
  it { should have_field :title }

  describe "full text search" do
    before do
      @tagged_activity = create(:activity, title: "my activity", tags: ["tag"])
      @untagged_activity = create(:activity)
    end

    it "should be able to be found by title" do
      @results = Activity.full_text_search("my activity")
      @results.should include @tagged_activity
    end

    it "should return tagged activity" do
      @results = Activity.full_text_search("tag")
      @results.should include @tagged_activity
    end
  end
end
