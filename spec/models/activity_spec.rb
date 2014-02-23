require 'spec_helper'

describe Activity do
  it { should have_and_belong_to_many :users }
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

  describe "can return nearby users" do
    let(:coordinates) { { lat: 37.7716634, long: -122.4043235 } }
    let(:nearby_activity_location) { create(:location, coordinates: coordinates) }
    let(:activity) { create(:activity) }
    let(:nearby_user_location) { create(:location, coordinates: coordinates ) }
    let(:nearby_user) { create(:user) }
    let(:far_location) { create(:location) }
    let(:far_user) { create(:user) }

    before do
      activity.location = nearby_activity_location
      nearby_user.location = nearby_user_location
      far_user.location = far_location
    end

    it "should return nearby users" do
      activity.nearby_users.should include nearby_user
      activity.nearby_users.should_not include far_user
    end
  end

end
