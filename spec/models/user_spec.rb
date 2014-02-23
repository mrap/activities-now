require 'spec_helper'

describe User do
  it { should have_and_belong_to_many :activities }
  it { should have_and_belong_to_many :tags }
  it { should have_field :name }
  it { should have_field :device_token }
  it { should validate_presence_of :name }

  describe "Getting nearby users with tag" do
    let(:tag) { create(:tag) }
    let(:coordinates) { { lat: 37.7716634, long: -122.4043235 } }
    let(:original_user_location) { create(:location, coordinates: coordinates) }
    let(:tagged_user_location) { create(:location, coordinates: coordinates ) }
    let(:tagged_user) { create(:user) }
    let(:untagged_user_location) { create(:location, coordinates: coordinates ) }
    let(:untagged_user) { create(:user) }

    before do
      tagged_user.location = tagged_user_location
      tagged_user.tags << tag
      tagged_user.save
      untagged_user
      untagged_user.save
    end

    it "should only return the tagged user" do
      results = User.nearby_users_with_tag(original_user_location.coordinates, tag)
      results.should include tagged_user
      results.should_not include untagged_user
    end

  end
end
