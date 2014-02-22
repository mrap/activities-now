require 'spec_helper'

describe Activity do
  it { should have_field :title }
  it { should have_and_belong_to_many :tags }

  describe "full text search" do
    before do
      @tag = create(:tag, name: "my tag")
      @tagged_activity = create(:activity, title: "my activity")
      @tagged_activity.tags << @tag
      @untagged_activity = create(:activity)
    end

    it "should be able to be found by title" do
      @results = Activity.full_text_search("my activity")
      @results.should include @tagged_activity
    end

    it "should return tagged activity" do
      @results = Activity.full_text_search("my tag").to_a
      @results.should include @tagged_activity
    end
  end
end
