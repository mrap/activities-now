require 'spec_helper'

describe Location do
  it "test factory" do
    @location = create(:location)
    @location.should_not be_nil
  end
end
